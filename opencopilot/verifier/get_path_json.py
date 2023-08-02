# https://github.com/shilch/seccomp/blob/master/extract_syscalls.sh
from z3 import *
import os
import subprocess
from opencopilot.z3_vector_db.summary import get_onefunction


def prompt(context: str, program: str, error: str):
    pass


def parse_bpftrace_program(context: str, program: str):
    """
    parse one program, the bpftrace will first compile, the compiler has the assume for z3 to verify
    Args:
        context: The context is for the current context
        program: 

    Returns:

    """
    with open("/tmp/tmp.bt", "w") as f:
        f.write(program)
    try:
        var = subprocess.check_output["sudo", "bpftrace", "-d", "/tmp/tmp.bt"]
        print(var)
    except Exception as error:
        prompt(context, program, error)


def symbolize_func(func: str, variable):
    pass


def symbolize_var(variable: str):
    pass


def read_function(file: object):
    """
    """


# extract all the function calls

# prompt from the vectordb and gen

if __name__ == "__main__":
    context = "The following is the code Print entered bash commands from all running shells. For Linux, uses bpftrace and eBPF. This works by tracing the readline() function using a uretprobe (uprobes)."
    program = """
#!/usr/bin/env bpftrace

BEGIN
{
	printf("Tracing bash commands... Hit Ctrl-C to end.\n");
	printf("%-9s %-6s %s\n", "TIME", "PID", "COMMAND");
}

uretprobe:/bin/bash:readline
{
	time("%H:%M:%S  ");
	printf("%-6d %s\n", pid, str(retval));
}

}"""
    parse_bpftrace_program(context, program)
