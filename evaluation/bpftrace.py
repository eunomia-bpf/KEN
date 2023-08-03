import subprocess
import json
import unittest
import threading

from typing import List, TypedDict
from typing import Optional

import os
from langchain.document_loaders import JSONLoader
from langchain.vectorstores import FAISS
from langchain.embeddings.openai import OpenAIEmbeddings

simple_examples = """
# list probes containing "sleep"
bpftrace -l '*sleep*'

# trace processes calling sleep
bpftrace -e 'kprobe:do_nanosleep { printf("PID %d sleeping...\n", pid); }'

# count syscalls by process name
bpftrace -e 'tracepoint:raw_syscalls:sys_enter { @[comm] = count(); }'

# Files opened by process
bpftrace -e 'tracepoint:syscalls:sys_enter_open { printf("%s %s\n", comm, str(args->filename)); }'

# Syscall count by program
bpftrace -e 'tracepoint:raw_syscalls:sys_enter { @[comm] = count(); }'

# Read bytes by process:
bpftrace -e 'tracepoint:syscalls:sys_exit_read /args->ret/ { @[comm] = sum(args->ret); }'

# Read size distribution by process:
bpftrace -e 'tracepoint:syscalls:sys_exit_read { @[comm] = hist(args->ret); }'

# Show per-second syscall rates:
bpftrace -e 'tracepoint:raw_syscalls:sys_enter { @ = count(); } interval:s:1 { print(@); clear(@); }'

# Trace disk size by process
bpftrace -e 'tracepoint:block:block_rq_issue { printf("%d %s %d\n", pid, comm, args->bytes); }'

# Count page faults by process
bpftrace -e 'software:faults:1 { @[comm] = count(); }'

# Count LLC cache misses by process name and PID (uses PMCs):
bpftrace -e 'hardware:cache-misses:1000000 { @[comm, pid] = count(); }'

# Profile user-level stacks at 99 Hertz, for PID 189:
bpftrace -e 'profile:hz:99 /pid == 189/ { @[ustack] = count(); }'

# Files opened, for processes in the root cgroup-v2
bpftrace -e 'tracepoint:syscalls:sys_enter_openat /cgroup == cgroupid("/sys/fs/cgroup/unified/mycg")/ { printf("%s\n", str(args->filename)); }'

"""


def get_bpftrace_basic_examples(query: str) -> str:
    loader = JSONLoader(
        file_path='../examples/bpftrace/examples.json',
        jq_schema='.data[].content',
        json_lines=True
    )
    documents = loader.load()
    embeddings = OpenAIEmbeddings()

    # Check if the vector database files exist
    if not (os.path.exists("./data_save/vector_db.faiss") and os.path.exists("./data_save/vector_db.pkl")):
        db = FAISS.from_documents(documents, embeddings)
        db.save_local("./data_save", index_name="vector_db")
    else:
        # Load an existing FAISS vector store
        db = FAISS.load_local(
            "./data_save", index_name="vector_db", embeddings=embeddings)

    results = db.search(query, search_type='similarity')
    results = [result.page_content for result in results]
    return "\n".join(results[:2])

def construct_bpftrace_examples(text: str) -> str:
    examples = get_bpftrace_basic_examples(text)
    # docs = db.similarity_search(text)
    # examples += "\n The following is a more complex example: \n"
    # examples += docs[0].page_content
    return examples


class CommandResult(TypedDict):
    command: str
    stdout: str
    stderr: str
    returncode: int


def run_command_with_timeout(command: List[str], timeout: int, require_check: bool = True) -> CommandResult:
    """
    This function runs a command with a timeout.
    """
    print("The bpf program to run is: " + ' '.join(command))
    print("timeout: " + str(timeout))
    if require_check:
        user_input = input("Enter 'y' to proceed: ")
        if user_input.lower() != 'y':
            print("Aborting...")
            exit()
    # Start the process
    with subprocess.Popen(command, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True) as process:
        timer = threading.Timer(timeout, process.kill)
        stdout = ""
        stderr = ""
        try:
            # Set a timer to kill the process if it doesn't finish within the timeout
            timer.start()
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
            # Make sure the timer is canceled
            timer.cancel()
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


class TestRunBpftrace(unittest.TestCase):
    def test_run_command_with_timeout_short_live(self):
        command = ["ls", "-l"]
        timeout = 5
        result = run_command_with_timeout(command, timeout, False)
        print(result)
        self.assert_(result["stdout"] != "")
        self.assertEqual(result["command"], "ls -l")
        self.assertEqual(result["returncode"], 0)

    def test_get_examples(self):
        get_bpftrace_basic_examples(
            "Trace allocations and display each individual allocator function call")
