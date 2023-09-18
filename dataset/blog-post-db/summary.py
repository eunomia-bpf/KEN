import json
import os
from langchain.chains.conversation.memory import ConversationBufferMemory
from langchain.chat_models import ChatOpenAI
from langchain.chains import ConversationChain


def generate_article_summaries():
    """
    Generates summaries for articles and saves them in a JSON file.

    Returns:
        None
    """

    folder_path = "./posts"
    files = os.listdir(folder_path)
    articles = {}
    for file_name in files:
        json_file = "./data/summary.json"
        file_path = os.path.join(folder_path, file_name)
        file_name = file_name[:-4]
        if file_name in articles:
            print(
                f"The article named {file_name} already exists. Skipping...")
            continue
        if os.path.isfile(file_path):
            try:
                with open(file_path, 'r', encoding='utf-8') as file:
                    content = file.read()
                    result = summarize_article(content)
                    articles[file_name] = result
                    print(
                        f"The article named <{file_name}> is finished. \n\n")
                    with open(json_file, 'w', encoding='utf-8') as file:
                        json.dump(articles, file)
            except Exception as _:
                print(
                    f"The article named <{file_name}> has failed... \n\n")
                # file_name = "failed.json"
                # with open(file_name, 'a+', encoding='utf-8') as file:
                #     file.write(result)


def summarize_article(content):
    """
    Generates a summary for an article.

    Args:
        content (str): The content of the article.

    Returns:
        str: The generated summary.
    """

    PROMPT = f"""
    You are tasked with reading the following article and generating three to four key questions based on its content. Then, provide answers to the questions you've generated. Each question and answer should be approximately 300 to 400 words long, and avoid being identical to the original text.
    Your question and answer should focus on practical examples of performance analysis or usage scenarios of tools. It should be concise, covering different aspects and including real-world analysis cases and tool usage strategies.
    The content of the article is as follows:
    ```text
    {content}
    ```
    """ + \
    """
    PLEASE PROVIDE THE CONTENT IN THE FOLLOWING FORMAT:
    ```json
    [{"question1": "answer1"}, {"question2": "answer2"}, {"question3": "answer3"}]
    ```
    Here is an example:
    ```json
    [
        {
            "How does bpftrace improve upon the limitations of traditional Linux performance tools, and can you provide a practical example of its usage?": "Traditional Linux performance tools often rely on counter-based metrics, which can provide average values but lack the ability to reveal the distribution of these values. This limitation can obscure the identification of outliers or multiple modes, which could be the real cause of performance issues. bpftrace, an open-source tracer for Linux, improves upon this by allowing for the decomposition of metrics into distributions or per-event logs, and the creation of new metrics for visibility into blind spots. \n A practical example of bpftrace usage is the tracing of read latency for a specific process ID (PID). The command `bpftrace -e 'kprobe:vfs_read /pid == 30153/ { @start[tid] = nsecs; } kretprobe:vfs_read /@start[tid]/ { @ns = hist(nsecs - @start[tid]); delete(@start[tid]); }'` is used to trace the distribution of read latency for PID 30153, showing it as a power-of-two histogram. This allows for a detailed analysis of read latency, which can reveal performance issues not visible with average latency values alone."
        },
        {
            "What are the different types of probes supported by bpftrace and how can they be used in performance analysis?": "bpftrace supports a variety of probe types, each offering different capabilities for performance analysis. These include tracepoint (kernel static instrumentation points), usdt (user-level statically defined tracing), kprobe and kretprobe (kernel dynamic function instrumentation and return), uprobe and uretprobe (user-level dynamic function instrumentation and return), software (kernel software-based events), hardware (hardware counter-based instrumentation), and others. For instance, kprobe and kretprobe can be used to instrument the entry and return of kernel functions, respectively. This allows for detailed tracking of function execution times, which can be crucial in identifying performance bottlenecks. An example of this is the command `bpftrace -e 'kretprobe:sys_read /pid == 181/ { @bytes = hist(retval); }'`, which instruments the return of the `sys_read()` kernel function and produces a histogram of the returned read size for PID 181. This can help identify if an application is performing inefficient read operations, such as frequent 1-byte reads, which could be optimized."
        },
        {
            "How does bpftrace compare to BCC (BPF Compiler Collection) in terms of use cases and tool development?": "Both bpftrace and BCC are powerful tools for performance analysis and troubleshooting, but they are best suited for different scenarios. bpftrace is ideal for short scripts and ad hoc investigations. It allows for quick, on-the-fly performance analysis, making it a valuable tool for identifying and diagnosing unexpected performance issues. On the other hand, BCC is more suited for developing complex tools and agents. It provides a BPF library and interfaces for writing programs in Python, C++, and Lua, making it a more versatile tool for creating sophisticated performance analysis applications. For instance, at Netflix, the performance team uses BCC for developing canned tools that others can easily use, and for developing agents, while bpftrace is used for ad hoc analysis."
        }
    ]
    ```
    """

    llm = ChatOpenAI(model_name="gpt-3.5-turbo-16k", temperature=0)
    agent_chain = ConversationChain(llm=llm, verbose=False, memory=ConversationBufferMemory())
    response = agent_chain.predict(input=PROMPT)
    return response


if __name__ == "__main__":
    generate_article_summaries()
