# https://github.com/shilch/seccomp/blob/master/extract_syscalls.sh
from z3 import *
import os, re, json
import subprocess
from opencopilot.z3_vector_db.z3_conditions_for_ebpf import generate_response


# prompt what should be changed

def replace_bpftrace_sassert_func_to_error(program: str):
    pattern = r"sassert\((.+)\);"
    repl = r"if(!(\1)) {error();}"
    s = re.sub(pattern, repl, program)
    return s


def replace_bpftrace_with_pre_post(program: str, function: str, pre: str, post: str):
    pattern = re.compile(function + r"((.*\n)*)\{((.*\n)+)\}")
    # try:
    temp = re.search(pattern, program)
    temp = temp.group().split("}")[0] + "}"
    print("tmp", temp)
    temp_program = program.split(temp)
    repl = function + r"\1{" + pre + r"\3" + post + r"}"
    s = re.sub(pattern, repl, temp)
    s = temp_program[0] + s + temp_program[1]
    # except:
    #     return program

    return s


def replace_line(program, line, content):
    lines = program.splitlines()
    if line <= len(lines):
        lines[
            line - 1
        ] = content  # -1 because list indices start at 0, but we're treating lines as starting at 1
        return "\n".join(lines)
    else:
        return program


def get_bpf_prompt(
    context: str,
    program: str,
    line: str,
    linenumber: int,
    file: str = "bpftrace_z3_tmp.json",
    error="",
) -> object:
    """
    prompt the current codedb and return the pre condition and post conditino json
    """
    prompted_pre_post = bpf_prompt(context, program, line, linenumber, file, error)
    program = program.replace(line.strip(), prompted_pre_post)

    program = replace_bpftrace_sassert_func_to_error(program)
    return program


def bpf_prompt(
    context: str,
    program: str,
    function: str,
    linenumber: int,
    file: str = "bpftrace_z3_tmp.json",
    error: str = "",
) -> object:
    """
    prompt the current codedb and return the pre condition and post conditino json
    """
    # get format promt from

    # has db
    json_template = ""
    json_ = json.load(open("opencopilot/z3_vector_db/data/" + file, "r"))
    for li in list(json_[0].keys()):
        if li == function:
            json_template = json_[li]

    prompt = (
        f"""
    I'm working on a project involving writing {"bpftrace" if file.__contains__("bpftrace") else "libbpf"} programs and I just got the job of context "{context}", in my coded program "{program}" line {linenumber}, {function}, can you provide some refined constraints information on this line considering the context. 
    """
        + f"Here's the broader constraints of this function: {json_template}"
        if json_template != 0
        else ""
        + f"However, last time you generate wrong the function with error: {error}. "
        if error != ""
        else ""
        f"""
    Can you generate the refined constraints in following C format:
    ```c
      assume([a>19]);
      {function}
      sassert([a<399]);
    ```
    The requirement is to put the condition to the correstponding [], and should comply the c definitoin so that all the variable is defined in the context and should pass bpftrace compiler.
    """
    )
    print("prompts\n", prompt)

    response = generate_response(prompt)
    print("responses", response)
    code_pattern = r"```c\n(.*?)\n```"
    c_code = re.findall(code_pattern, response, re.DOTALL)
    if not c_code or c_code.__contains__("assume") or c_code.__contains__("sassert"):
        c_code = function

    print(c_code, "\n\n")
    return c_code.replace(";\n", ";")


def get_kprobe_prompt(
    context: str,
    program: str,
    line: str,
    linenumber: int,
    file: str = "bpftrace_z3_tmp.json",
    error="",
) -> object:
    """
    prompt the current codedb and return the pre condition and post conditino json
    """
    prompted_pre_post = kprobe_prompt(
        context, program, line, linenumber, file=file, error=error
    )
    prompted_pre = prompted_pre_post.splitlines()[0]
    try:
        prompted_post = prompted_pre_post.splitlines()[1]
    except:
        prompted_post = ""
    program = replace_bpftrace_with_pre_post(
        program, line.strip(), prompted_pre, prompted_post
    )

    program = replace_bpftrace_sassert_func_to_error(program)
    return program


def kprobe_prompt(
    context: str,
    program: str,
    function: str,
    linenumber: int,
    file: str = "bpftrace_z3_tmp.json",
    error: str = "",
) -> object:
    """
    prompt the current codedb and return the pre condition and post conditino json
    """
    # get format promt from

    # has db
    json_template = ""
    json_ = json.load(open("opencopilot/z3_vector_db/data/" + file, "r"))
    for li in list(json_[0].keys()):
        if li == function:
            json_template = json_[0][li]
    program_name = "bpftrace" if file.__contains__("bpftrace") else "libbpf"
    prompt = (
        f"""
    I'm working on a project involving writing {program_name} programs and I just got the job of {context}, in my coded program "{program}" line {linenumber}, {function}, I need to verify based on the context of what I ask, can you provide some refined constraints information on this line considering the context. 
    """
        + (
            f"Here's the broader constraints of this function: {json_template['description']} with pre condition {', '.join(map(lambda kv: f'{kv[0]} should be {kv[1]}', json_template['pre'].items()))}"
            if json_template != ""
            else ""
        )
        + (
            f"However, last time you generate wrong the function with error: {error}. "
            if error != ""
            else ""
        )
        + f"""
    You should generate the refined constraints in following C format:
    ```c
      assume([]);
      sassert([]);
    ```
    The requirement is to put the pre condition to the correstponding [] which assume will be inserted in line {(linenumber+2)}, sassert will be inserted in the end of the function and should comply the c definitoin so that all the variable is defined in the context and should pass bpftrace compiler. And we know the definition of policy_node is  int policy_node(gfp_t gfp, struct mempolicy *policy, int nd), we should put all the first argument gfp's operation as to arg0, the second policy be arg1, the third nd be arg2
    """
    )
    print("prompts\n", prompt)

    response = generate_response(prompt)
    print("responses", response)
    code_pattern = r"```c\n(.*?)\n```"
    c_code = re.findall(code_pattern, response, re.DOTALL)
    if not c_code or c_code.__contains__("assume") or c_code.__contains__("sassert"):
        c_code = ""
    else:
        c_code = c_code[0]

    print(c_code, "\n\n")
    return c_code


def verify_z3(prompt_function, context, program, function, linenumber) -> object:
    """
    compile the result gives sat/unsat
    sudo docker run  -d $PWD:$PWD seahorn sleep 10000000
    """
    with open("opencopilot/ebpf_vector_db/libbpf/build/tmp.ll", "w") as f:
        f.write(program)
    # os.system(
    #     "docker exec d6c sea smt /code/OpenCopilot/opencopilot/ebpf_vector_db/libbpf/build/tmp.ll -o /code/OpenCopilot/opencopilot/ebpf_vector_db/libbpf/build/tmp.smt2"
    # )
    try:
        sat = subprocess.run([
            "z3",
            "/home/victoryang00/Documents/plos23/OpenCopilot/opencopilot/ebpf_vector_db/libbpf/build/tmp.smt2",
        ],text=True, capture_output=True)
        if sat.stdout.__contains__("sat"):
            return sat == "sat"
        else:
            for i in range(3):  # retry 3 times
                program = prompt_function(
                    context, program, function, linenumber, "z3 error:" + sat
                )
                verify_z3(prompt_function, context, program, function, linenumber)
    except:
        print("error in verify z3")

        # try again?


def get_linenumber(output_string: str):
    return 0


def compile_bpftrace_once(prompt_function, context, program, line, linenumber):
    with open("/tmp/tmp.bt", "w") as f:
        f.write(program)
    # try:
    var = subprocess.run(
        [
            "sudo",
            "/home/victoryang00/Documents/plos23/bpftrace/build/src/bpftrace",
            "-d",
            "/tmp/tmp.bt",
        ],
        text=True,
        capture_output=True,
    )
    # print(var)
    # parce from the normal function to result
    if var.returncode != 0:
        return compile_bpftrace_once(
            prompt_function,
            context,
            prompt_function(
                context,
                program,
                line,
                linenumber,
                error="nd is the first argument which should be arg0",
            ),
            line,
            linenumber,
        )
    else:
        return var.stdout
    # except Exception as error:
    #     pass


def parse_bpftrace_program(context: str, program: str):
    """
    parse one program, the bpftrace will first compile, the compiler has the assume for z3 to verify
    Args:
        context: The context is for the current context
        program:

    Returns:
        executed results

    """
    # currently only support kprobe and user defined function
    function_filter = [
        "avg",
        "buf",
        "cat",
        "cgroupid",
        "clear",
        "count",
        "delete",
        "exit",
        "hist",
        "join",
        "kaddr",
        "kptr",
        "ksym",
        "lhist",
        "macaddr",
        "max",
        "min",
        "ntop",
        "override",
        "print",
        "printf",
        "cgroup_path",
        "reg",
        "signal",
        "stats",
        "str",
        "strerror",
        "strftime",
        "strncmp",
        "strcontains",
        "sum",
        "system",
        "time",
        "uaddr",
        "uptr",
        "usym",
        "zero",
        "path",
        "unwatch",
        "bswap",
        "skboutput",
        "pton",
        "debugf",
        "assume",
        "error",
    ]
    function_matches = re.findall(r"\w+\([^)]*\)", program)
    print(function_matches)
    function_matches = [
        s for s in function_matches if not any(subs in s for subs in function_filter)
    ]
    print(function_matches)
    uprobe_matches = re.findall(r"uretprobe:.+", program)
    kprobe_matches = re.findall(r"kprobe:.+", program)
    kretprobe_matches = re.findall(r"kretprobe:.+", program)
    print(kprobe_matches)

    tracepoint_matches = re.findall(r"tracepoint:.+", program)

    for linenumber, line in enumerate(program.splitlines()):
        print(linenumber, line)
        if linenumber == 0 or line.strip() == "":
            continue
        for match in function_matches:
            if match.startswith(line.strip()):
                # try:
                print(line, "line", match)
                program_tmp = program
                program = get_bpf_prompt(context, program, line, linenumber)
                program = compile_bpftrace_once(
                    bpf_prompt, context, program, line, linenumber
                )
                res = verify_z3(bpf_prompt, context, program, line, linenumber)
                if not res:
                    program = program_tmp
                # except:
                #     print("error in geting the smt")
        for match in kprobe_matches:
            if match.startswith(line.strip()):
                program_tmp = program
                program = get_kprobe_prompt(context, program, line, linenumber)
                print("program\n", program)
                program = compile_bpftrace_once(
                    get_kprobe_prompt, context, program, line, linenumber
                )
                parts = program.split("ModuleID")

                substring = "; ModuleID " + parts[1].strip()
                res = verify_z3(get_kprobe_prompt, context, substring, line, linenumber)
                if not res:
                    program = program_tmp


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
    context = "tracing the policy_node() function to hook all the function of policy_node and add up the arg0 as nd only if the nd is 2."
    program = """
#!/usr/bin/env bpftrace

BEGIN
{
	printf("Tracing bash commands... Hit Ctrl-C to end.\\n");
	printf("%-9s %-6s %s\\n", "TIME", "PID", "COMMAND");
}

kprobe:policy_node
{
	@reqts[arg2] +=1;
}

END
{
	clear(@reqts);
}
"""
    parse_bpftrace_program(context, program)
    # print(replace_bpftrace_sassert_func_to_error(program))
    # print(replace_bpftrace_with_pre_post(program, "kprobe:policy_node","assume(nd==1);","sassert(nd==1);"))

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
