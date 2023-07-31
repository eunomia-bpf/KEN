# https://github.com/shilch/seccomp/blob/master/extract_syscalls.sh
from z3 import *
import os
import subprocess
from opencopilot.z3_vector_db import get_onefunction

def prompt(program:str, error:str):

    pass


def parse_bpftrace_program(program: str):
    """
    parse one program, the bpftrace will first compile, the compiler has the assume for z3 to verify
    Args:
        program:

    Returns:

    """
    with open("/tmp/tmp.bt","w") as f:
        f.write(program)
    try:
        var = subprocess.check_output["sudo", "bpftrace", "-d", "/tmp/tmp.bt"]

    except:
        pass
        # prompt(program, error)



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
    program = """
#!/usr/bin/env bpftrace
/*
 * bashreadline    Print entered bash commands from all running shells.
 *                 For Linux, uses bpftrace and eBPF.
 *
 * This works by tracing the readline() function using a uretprobe (uprobes).
 *
 * USAGE: bashreadline.bt
 *
 * This is a bpftrace version of the bcc tool of the same name.
 *
 * Copyright 2018 Netflix, Inc.
 * Licensed under the Apache License, Version 2.0 (the "License")
 *
 * 06-Sep-2018	Brendan Gregg	Created this.
 */

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
    parse_bpftrace_program(program)
