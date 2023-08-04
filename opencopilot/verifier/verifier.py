# https://github.com/shilch/seccomp/blob/master/extract_syscalls.sh
from z3 import *
import os, re, json
import subprocess
from opencopilot.z3_vector_db.z3_conditions_for_ebpf import generate_response


def replace_bpftrace_sassert_func_to_error(program: str):
    pattern = r"sassert\((\w+)\)"
    repl = r"if(!(\1)) {error();}"
    s = re.sub(pattern, repl, program)
    return s


def bpf_prompt(
    context: str,
    program: str,
    function: str,
    linenumber: int,
    file: str = "bpftrace_z3.json",
    error: str = "",
) -> object:
    """
    prompt the current codedb and return the pre condition and post conditino json
    """
    # get format promt from
    # has db
    json_template = ""
    json_ = json.load(open("../z3_vector_db/data/" + file, "r"))
    for li in list(json_[0].keys()):
        if li == function:
            pass  # TODO

    prompt = (
        f"""
    I'm working on a project involving eBPF (Extended Berkeley Packet Filter) programs and I just got the job of context "{context}", in my coded program "{program}" line {linenumber}, {function}, can you provide some refined constraints information on this line considering the context. 
    """
        + f"Here's the broader constraints of this function: {json_template}"
        if json_template != 0
        else ""
        + """
    Can you generate the refined constraints in following JSON format:
    ```json
    {
        "bpf_map_update_elem": {
            "description": "Add or update the value of the entry associated to *key* in *map* with *value*.",
            "pre": {
                "map": "!=null",
                "key": "!=null",
                "value": "!=null",
                "flags": "in [BPF_NOEXIST, BPF_EXIST, BPF_ANY]",
                "map_type": "not in [BPF_MAP_TYPE_ARRAY, BPF_MAP_TYPE_PERCPU_ARRAY] when flags == BPF_NOEXIST"
            },
            "post": {
                "return": "in [0, negative number]"
            }
        }
    }
    ```
    """
    )

    response = generate_response(prompt)
    code_pattern = r"```json\n(.*?)\n```"
    json_code = re.findall(code_pattern, response, re.DOTALL)
    if not json_code:
        json_code = response

    responses += json_code
    print(json_code, "\n\n")
    # refine model


def get_pre_condition(pre_json: object) -> str:
    """
    prompt the chatgpt to rewrite the condition to c style
    """


def get_post_condition(post_json: object) -> str:
    """
    prompt the chatgpt to rewrite the condition to c style
    """


def verify_z3() -> object:
    """
    compile the result gives sat/unsat
    sudo docker run  -d $PWD:$PWD seahorn sleep 10000000
    """
    os.system(
        "docker exec d6c sea smt /code/OpenCopilot/opencopilot/ebpf_vector_db/libbpf/build/tmp.ll -o /code/OpenCopilot/opencopilot/ebpf_vector_db/libbpf/build/tmp.smt2"
    )
    try:
        sat = subprocess.check_output[
            "z3",
            "/home/victoryang00/Documents/plos23/OpenCopilot/opencopilot/ebpf_vector_db/libbpf/build/tmp.smt2",
        ]
        return sat == "sat"
    except:
        print("error in verify z3")
        # try again?


def compile_bpftrace_once(program: str):
    with open("/tmp/tmp.bt", "w") as f:
        f.write(program)
    try:
        var = subprocess.check_output["bpftrace", "-d", "/tmp/tmp.bt"]
        print(var)
        # parce from the normal function to result
    except Exception as error:
        bpf_prompt(context, program, error)


def parse_bpftrace_program(context: str, program: str):
    """
    parse one program, the bpftrace will first compile, the compiler has the assume for z3 to verify
    Args:
        context: The context is for the current context
        program:

    Returns:

    """
    matches = re.findall(r"\w+\([^)]*\)", program)
    for linenumber, line in enumerate(program.splitlines()):
        for match in matches:
            if match.startswith(line.strip()):
                try:
                    print(line)
                    prompt_json = bpf_prompt(context, program, line, linenumber)
                    # TODO: passed the json in
                    program_tmp = program
                    program = program.replace(
                        match, get_pre_condition(prompt_json) + match
                    )
                    program = program.replace(
                        match, match + get_post_condition(prompt_json)
                    )

                    program = replace_bpftrace_sassert_func_to_error(program)
                    print(program)
                    res = verify_z3(program)
                    if res == False:
                        program = program_tmp

                except:
                    print("error in geting the smt")


def parse_libbpf_program(context: str, program: str):
    """
    parse one program, the libbpf will first compile, the compiler has the assume for z3 to verify
    Args:
        context: The context is for the current context
        program:

    Returns:

    """
    for line in program.splitlines():
        print(line)
        print("\n")
        bpf_prompt(context, line)
    with open("/tmp/tmp.bpc.c", "w") as f:
        f.write(program)
    try:
        var = subprocess.check_output["sudo", "bpftrace", "-d", "/tmp/tmp.bpf.c"]
        print(var)
    except Exception as error:
        bpf_prompt(context, program, error)


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

#     context = "The following is the code Print entered bash commands from all running shells. For Linux, uses bpftrace and eBPF. This works by tracing the readline() function using a uretprobe (uprobes)."
#     program = """
# #include <vmlinux.h>
# #include <bpf/bpf_helpers.h>
# #include <bpf/bpf_tracing.h>
# #include <bpf/bpf_core_read.h>
# #include "maps.bpf.h"

# #define BUCKET_MULTIPLIER 50
# #define BUCKET_COUNT 20

# struct {
#     __uint(type, BPF_MAP_TYPE_HASH);
#     __uint(max_entries, BUCKET_COUNT + 2);
#     __type(key, u64);
#     __type(value, u64);
# } tcp_syn_backlog SEC(".maps");

# static int do_count(u64 backlog)
# {
#     u64 bucket = backlog / BUCKET_MULTIPLIER;

#     increment_map(&tcp_syn_backlog, &bucket, 1);
#     increment_map(&tcp_syn_backlog, &bucket, backlog);

#     return 0;
# }

# SEC("kprobe/tcp_v4_syn_recv_sock")
# int BPF_KPROBE(kprobe__tcp_v4_syn_recv_sock, struct sock *sk)
# {
#     return do_count(BPF_CORE_READ(sk, sk_ack_backlog) / 50);
# }

# SEC("kprobe/tcp_v6_syn_recv_sock")
# int BPF_KPROBE(kprobe__tcp_v6_syn_recv_sock, struct sock *sk)
# {
#     return do_count(BPF_CORE_READ(sk, sk_ack_backlog) / 50);
# }

# char LICENSE[] SEC("license") = "GPL";
# """
#     parse_libbpf_program(context, program)
