import { ParsedEvent, ReconnectInterval } from '@/types/types';
import { getExamples } from './eBPFDatabase';

const createPrompt = async (
  query: string,
  apiKey: string,
) => {
  const complexExamples = await getExamples(query, apiKey);
  const PROMPT = `
  Please create a BPFTrace program that accomplishes the following task: ${query}
  The program should be syntactically correct and ready for execution. 
  You can assume that the required BPFTrace probes and functions are available.
  Below are some simple examples of bpftrace usage:
  
  # trace processes calling sleep
  'kprobe:do_nanosleep { printf("PID %d sleeping...\n", pid); }'
  
  # count syscalls by process name
  'tracepoint:raw_syscalls:sys_enter { @[comm] = count(); }'
  
  # Files opened by process
  'tracepoint:syscalls:sys_enter_open { printf("%s %s\n", comm, str(args->filename)); }'
  
  # Syscall count by program
  'tracepoint:raw_syscalls:sys_enter { @[comm] = count(); }'
  
  # Read bytes by process:
  'tracepoint:syscalls:sys_exit_read /args->ret/ { @[comm] = sum(args->ret); }'
  
  # Read size distribution by process:
  'tracepoint:syscalls:sys_exit_read { @[comm] = hist(args->ret); }'
  
  # Show per-second syscall rates:
  'tracepoint:raw_syscalls:sys_enter { @ = count(); } interval:s:1 { print(@); clear(@); }'
  
  # Trace disk size by process
  'tracepoint:block:block_rq_issue { printf("%d %s %d\n", pid, comm, args->bytes); }'
  
  # Count page faults by process
  'software:faults:1 { @[comm] = count(); }'
  
  # Count LLC cache misses by process name and PID (uses PMCs):
  'hardware:cache-misses:1000000 { @[comm, pid] = count(); }'
  
  # Profile user-level stacks at 99 Hertz, for PID 189:
  'profile:hz:99 /pid == 189/ { @[ustack] = count(); }'
  
  # Files opened, for processes in the root cgroup-v2
  'tracepoint:syscalls:sys_enter_openat /cgroup == cgroupid("/sys/fs/cgroup/unified/mycg")/ { printf("%s\n", str(args->filename)); }'
  
  Some more complex examples:
  ${complexExamples}
  GENERATE BPFTRACE EXECUTABLE CODE THAT SHOULD BE READY TO RUN WITHOUT ANY ADDITIONAL MODIFICATIONS!!!
  The code should be self-contained and able to run directly with BPFTrace. 
  The output should appear at the beginning of the response. 
  There's no need to include execution instructions or explanations. Just provide the BPFTrace code.
  Do not start with "\`\`\`bpftrace".
  `
  return PROMPT;
};

export const OpenAIStream = async (
  help_doc: string,
  language: string,
  model: string,
  key: string,
) => {
  const {createParser} = await import("eventsource-parser");

  const prompt = await createPrompt(help_doc, key);
  const system = { role: 'system', content: prompt };

  const res = await fetch(`https://api.openai.com/v1/chat/completions`, {
    headers: {
      'Content-Type': 'application/json',
      Authorization: `Bearer ${key || process.env.OPENAI_API_KEY}`,
    },
    method: 'POST',
    body: JSON.stringify({
      model,
      messages: [system],
      temperature: 0,
      stream: true,
    }),
  });

  const encoder = new TextEncoder();
  const decoder = new TextDecoder();

  if (res.status !== 200) {
    const statusText = res.statusText;
    const result = await res.body?.getReader().read();
    throw new Error(
      `OpenAI API returned an error: ${
        decoder.decode(result?.value) || statusText
      }`,
    );
  }
  let accumulatedText = '';
  const stream = new ReadableStream({
    async start(controller) {
      
      const onParse = (event: ParsedEvent | ReconnectInterval) => {
        if (event.type === 'event') {
          const data = event.data;

          if (data === '[DONE]') {
            controller.close();
            return;
          }

          try {
            const json = JSON.parse(data);
            const text = json.choices[0].delta.content;
            accumulatedText += text;
            const queue = encoder.encode(text);
            controller.enqueue(queue);
          } catch (e) {
            controller.error(e);
          }
        }
      };

      const parser = createParser(onParse);

      for await (const chunk of res.body as any) {
        parser.feed(decoder.decode(chunk));
      }
    },
  });
  
  return stream;
};
