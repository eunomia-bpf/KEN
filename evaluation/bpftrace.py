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
    return "\n".join(results[:4])

def construct_bpftrace_examples(text: str) -> str:
    examples = get_examples_from_db(text)
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

def bpftrace_run_program(program: str, timeout: int = 5) -> CommandResult:
    """
    This function runs a bpftrace program with a timeout.
    """
    return run_command_with_timeout(["sudo", "bpftrace", "-e", program], timeout)

def bpftrace_get_probes(regex: str) -> CommandResult:
    """
    This function gets the probes from bpftrace.
    """
    return run_command_with_timeout(["sudo", "bpftrace", "-l", regex], 5, False)

res = bpftrace_get_probes("*sleep*")
print(res)

class TestRunBpftrace(unittest.TestCase):
    def test_run_command_with_timeout_short_live(self):
        command = ["ls", "-l"]
        timeout = 5
        result = run_command_with_timeout(command, timeout, False)
        print(result)
        self.assertTrue(result["stdout"])
        self.assertEqual(result["command"], "ls -l")
        self.assertEqual(result["returncode"], 0)
    
    def test_bpftrace_get_probes(self):
        res = bpftrace_get_probes("*sleep*")
        print(res)
        self.assertEqual(result["returncode"], 0)

    def test_get_examples(self):
        res = get_examples_from_db(
            "Trace allocations and display each individual allocator function call")
        print(res)
        self.assertTrue(res)

