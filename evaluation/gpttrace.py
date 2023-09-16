from langchain.tools import StructuredTool
import subprocess
import json
import unittest
import threading
import signal
import argparse

from typing import List, TypedDict
from typing import Optional

import os
from langchain.document_loaders import JSONLoader
from langchain.vectorstores import FAISS
from langchain.embeddings.openai import OpenAIEmbeddings
from langchain.agents import Tool
from langchain.agents import AgentType
from langchain.memory import ConversationBufferMemory
from langchain.chat_models import ChatOpenAI
from langchain.utilities import SerpAPIWrapper
from langchain.agents import initialize_agent
from langchain import LLMMathChain, OpenAI
from langchain.callbacks.base import BaseCallbackHandler


class MyCustomHandler(BaseCallbackHandler):
    def on_llm_new_token(self, token: str, **kwargs) -> None:
        print(f"{token}")


simple_examples = """
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

"""

GET_EXAMPLE_PROMPT: str = """
    Get bpftrace examples from the database, with a query.
    If You need to write a ebpf program,
    Use this tool to check the examples before exec.

    The input should be an instruction, like:
        Write a BPF code that traces block I/O and measures the latency by initializing stacks, using kprobes and histogram.

    The return example is more complex examples, for top 4 results.
    """


def get_examples_from_db(query: str) -> str:
    embeddings = OpenAIEmbeddings()
    # Check if the vector database files exist
    if not (os.path.exists("./data_save/vector_db.faiss") and os.path.exists("./data_save/vector_db.pkl")):
        loader = JSONLoader(
            file_path='../examples/bpftrace/examples.json',
            jq_schema='.data[].content',
            json_lines=True
        )
        documents = loader.load()
        db = FAISS.from_documents(documents, embeddings)
        db.save_local("./data_save", index_name="vector_db")
    else:
        # Load an existing FAISS vector store
        db = FAISS.load_local(
            "./data_save", index_name="vector_db", embeddings=embeddings)

    results = db.search(query, search_type='similarity')
    results = [result.page_content for result in results]
    return simple_examples + "\n".join(results[:3])


def construct_bpftrace_examples(text: str) -> str:
    examples = get_examples_from_db(text)
    return examples


class CommandResult(TypedDict):
    command: str
    stdout: str
    stderr: str
    returncode: int


def run_command(command: List[str], require_check: bool = False) -> CommandResult:
    """
    This function runs a command with a timeout.
    """
    print("The bpf program to run is: " + ' '.join(command))
    if require_check:
        user_input = input("Enter 'y' to proceed, and hit Ctrl C to stop: ")
        if user_input.lower() != 'y':
            print("Aborting...")
            return {
                "command": ' '.join(command),
                "stdout": "",
                "stderr": "User not permit execute the program",
                "returncode": -1
            }
    # Start the process
    with subprocess.Popen(command,
                          stdout=subprocess.PIPE,
                          stderr=subprocess.PIPE,
                          text=True,
                          ) as process:
        stdout = ""
        stderr = ""
        try:
            # Set a timer to kill the process if it doesn't finish within the timeout
            while process.poll() is None:
                # Only try to read output if the process is still running
                if process.stdout.readable():
                    line = process.stdout.read()
                    print(line, end='')
                    stdout += line
            # Wait for the process to finish and get the output
            last_stdout, last_stderr = process.communicate()
            stdout += last_stdout
            stderr += last_stderr
        except Exception as e:
            print("Exception: " + str(e))
        finally:
            print("kill process " + str(process.pid))
            # Make sure the timer is canceled
            if process.poll() is None and process.stdout.readable():
                stdout += process.stdout.read()
                print(stdout)
            if process.poll() is None and process.stderr.readable():
                stderr += process.stderr.read()
                print(stderr)
            return {
                "command": ' '.join(command),
                "stdout": stdout,
                "stderr": stderr,
                "returncode": process.returncode
            }


RUN_PROGRAM_PROMPT: str = """
    Runs a eBPF program. You should only input the eBPF program itself.

    If user ask to trace or profile something, 
    You need to use this tool to run eBPF programs.

    You should always try to:
    - find examples from the database before writing a program
    - find the possible hooks from the kernel before writing a program
    - after running a program, you should try to explain the program and output result to the user
    - if error occurs, you should try to explain the error and get the examples and hook points to retry again.
    """

global_save_file: str = "result/program-" + str(os.getpid()) + ".json"

def bpftrace_run_program(program: str) -> str:
    res = run_command(["sudo", "timeout", "--preserve-status",
                      "-s", "2", "20", "bpftrace", "-e", program])
    return json.dumps(res)

GET_HOOK_PROMPT: str = """
    Gets the useable hooks from bpftrace. 
    
    If You need to write a ebpf program,
    Use this tool to check the hook points before exec. The input should be a regex,
    For example:

    '*sleep*'

    Will get the following probes:

    kprobe:mmc_sleep_busy_cb
    kprobe:msleep
    kprobe:msleep_interruptible
    kprobe:pinctrl_force_sleep
    kprobe:pinctrl_pm_select_sleep_state
    tracepoint:syscalls:sys_enter_nanosleep
    tracepoint:syscalls:sys_exit_clock_nanosleep
    tracepoint:syscalls:sys_exit_nanosleep
    """


def bpftrace_get_hooks(regex: str) -> str:
    res = run_command(["sudo", "bpftrace", "-l", regex], False)
    return json.dumps(res)[:1024]


def get_gpttrace_tools() -> List[Tool]:
    bpftrace_run_tool = Tool.from_function(bpftrace_run_program,
                                           "run-ebpf-program",
                                           description=RUN_PROGRAM_PROMPT)
    bpftrace_probe_tool = Tool.from_function(bpftrace_get_hooks,
                                             "get-ebpf-hooks-with-regex",
                                             description=GET_HOOK_PROMPT)
    get_examples_from_db_tool = Tool.from_function(
        get_examples_from_db,
        "get-ebpf-examples-with-query",
        description=GET_EXAMPLE_PROMPT)
    tools = [
        bpftrace_probe_tool,
        bpftrace_run_tool,
        get_examples_from_db_tool,
    ]
    return tools


def setup_openai_agent(model_name: str = "gpt-3.5-turbo", temperature: float = 0) -> AgentType:
    """
    setup the agent chain and return the agent
    """
    tools = get_gpttrace_tools()
    llm = ChatOpenAI(
        temperature=0, model_name=model_name)
    memory = ConversationBufferMemory(memory_key="chat_history")
    agent_chain = initialize_agent(
        tools, llm, agent=AgentType.OPENAI_MULTI_FUNCTIONS,  max_iterations=10,
        verbose=True, memory=memory)
    return agent_chain


def setup_react_agent(model_name: str = "gpt-3.5-turbo", temperature: float = 0) -> AgentType:
    """
    setup the agent chain and return the agent
    """
    tools = get_gpttrace_tools()
    llm = ChatOpenAI(
        temperature=0, model_name=model_name)
    memory = ConversationBufferMemory(memory_key="chat_history")
    agent_chain = initialize_agent(
        tools, llm, agent=AgentType.CHAT_ZERO_SHOT_REACT_DESCRIPTION,  max_iterations=10,
        verbose=True, memory=memory)
    return agent_chain


def main() -> None:
    """
    Program entry.
    """
    parser = argparse.ArgumentParser(
        prog="GPTtrace",
        description="Use ChatGPT to write eBPF programs (bpftrace, etc.)",
    )
    parser.add_argument(
        "-v", "--verbose",
        help="Show more details",
        action="store_true")
    parser.add_argument(
        "-k", "--key",
        help="Openai api key, see `https://platform.openai.com/docs/quickstart/add-your-api-key` or passed through `OPENAI_API_KEY`",
        metavar="OPENAI_API_KEY")
    parser.add_argument('input_string', type=str,
                        help='Your question or request for a bpf program')
    parser.add_argument('--model_name', type=str,
                        help='model_name', default="gpt-3.5-turbo")
    parser.add_argument('--agent_type', type=str,
                        help='agent_type')
    parser.add_argument('--save_file', type=str,
                        help='save result to file', default="./result/program.res")
    args = parser.parse_args()

    if os.getenv('OPENAI_API_KEY', args.key) is None:
        print(
            f"Either provide your access token through `-k` or through environment variable {OPENAI_API_KEY}")
        return

    save_file = args.save_file

    agent_chain = None
    if args.agent_type == "react":
        agent_chain = setup_react_agent(model_name=args.model_name)
    elif args.agent_type == "openai":
        agent_chain = setup_openai_agent(model_name=args.model_name)
    elif args.agent_type == "codellama":
        agent_chain = setup_codellama_agent(model_name=args.model_name)
    else:
        agent_chain = setup_react_agent(model_name=args.model_name)
    if args.input_string is not None:
        agent_chain.run(input=args.input_string)
    else:
        parser.print_help()

if __name__ == "__main__":
    main()

class TestRunBpftrace(unittest.TestCase):
    def test_run_command_short_live(self):
        command = ["ls", "-l"]
        timeout = 5
        result = run_command(command, False)
        print(result)
        self.assertTrue(result["stdout"])
        self.assertEqual(result["command"], "ls -l")
        self.assertEqual(result["returncode"], 0)

    def test_bpftrace_get_probes(self):
        result = bpftrace_get_probes("*sleep*")
        print(result)
        self.assertEqual(result["returncode"], 0)

    def test_get_examples(self):
        res = get_examples_from_db(
            "Trace allocations and display each individual allocator function call")
        print(res)
        self.assertTrue(res)
