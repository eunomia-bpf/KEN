# https://github.com/shilch/seccomp/blob/master/extract_syscalls.sh
from typing import TypedDict
from z3 import *
import os, re, json
import subprocess
from z3_vector_db.z3_conditions_for_ebpf import generate_response
from z3_vector_db.z3_conditions_for_ebpf import run_gpt_for_bpftrace_func


# prompt what should be changed
def replace_bpftrace_sassert_func_to_error(program: str):
    pattern = r"sassert\((.+)\);"
    repl = r"if(!(\1)) {error();}"
    s = re.sub(pattern, repl, program)
    return s


def replace_bpftrace_with_pre_post(program: str, function: str, pre: str, post: str) -> str:
    # Escape special characters in the function name for regex
    escaped_function = re.escape(function)
    
    # Use a non-greedy match for content inside the braces
    pattern = re.compile(escaped_function + r"\s*\{(.*?)\}", re.DOTALL)
    
    matches = pattern.findall(program)
    
    # If there's no match, return the original program
    if not matches:
        return program
    
    # For simplicity, replace only the first occurrence
    original_content = matches[0]
    replaced_content = pre + original_content + post
    
    # Use sub to replace the content
    result_program = re.sub(pattern, function + " {" + replaced_content + "}", program, count=1)
    
    return result_program


def replace_line(program, line, content):
    lines = program.splitlines()
    if line <= len(lines):
        lines[
            line - 1
        ] = content  # -1 because list indices start at 0, but we're treating lines as starting at 1
        return "\n".join(lines)
    else:
        return program


def gen_explaination_prompt():
    pass


def get_argument_prompt(
    function: str,
) -> object:
    """
    prompt argument prompt
    """
    function = function.replace("kprobe:", "").replace("kretprobe", "")
    function_def = ""
    with open(
        "z3_vector_db/data/bpf_kprobe_def_format.json",
        "r",
        encoding="utf-8",
    ) as file:
        data = json.load(file)
        for key, value in data.items():
            if key.__contains__(function):
                function_def = key

    prompt = (
        f"""
    I will assign you the job I have a function {function} like {function_def}, please provide me with the function definition and the corresponding argument to be assigned to arg0. I need the output only has the variable name without the type info. I want the result in the below text format :
    """
        + """
    ```text
    And we know the definition of {function} is {function definition}, we should put all the first argument {the first argument}'s operation as to arg0, the second argument {the second argument} be arg1, the third argument {the third argument} be arg2, {.. until the end of argument list}. You should replace the following paremeter with corresponding one.
    ```
    """
    )
    print("prompts\n", prompt)
    response = generate_response(prompt)
    code_pattern = r"```text\n(.*?)\n```"
    text_code = re.findall(code_pattern, response, re.DOTALL)
    if not text_code:
        return ""
    print("text code", text_code)
    return text_code[0]


def get_bpf_prompt(
    context: str,
    program: str,
    line: str,
    linenumber: int,
    file: str = "bpftrace_z3.json",
) -> object:
    """
    prompt the current codedb and return the pre condition and post conditino json
    """
    prompted_pre_post = bpf_prompt(context, program, line, linenumber, file)
    program = program.replace(line.strip(), prompted_pre_post)

    program = replace_bpftrace_sassert_func_to_error(program)
    return program


def bpf_prompt(
    context: str,
    program: str,
    function: str,
    linenumber: int,
    file: str = "bpftrace_z3.json",
) -> object:
    """
    prompt the current codedb and return the pre condition and post conditino json
    """
    # get format promt from

    # has db
    json_template = ""
    json_ = json.load(open("z3_vector_db/data/" + file, "r"))
    for li in list(json_[0].keys()):
        if li == function:
            json_template = json_[li]

    prompt = (
        f"""
    I'm working on a project involving writing 
    {"bpftrace" if file.__contains__("bpftrace") else "libbpf"} 
    programs and I just got the job of context "{context}", 
    in my coded program "{program}" line {linenumber}, {function}, 
    can you provide some refined constraints 
    information on this line considering the context. 
    """
        + f"Here's the broader constraints of this function: {json_template}"
        if json_template != 0
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
    print("\nbpf_prompt prompts\n", prompt)

    response = generate_response(prompt)
    print("\nbpf_prompt responses\n", response)
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
    file: str = "bpftrace_z3.json",
) -> object:
    """
    prompt the current codedb and return the pre condition and post conditino json
    """
    prompted_pre_post = kprobe_prompt(context, program, line, linenumber, file=file)
    if len(prompted_pre_post.splitlines()) == 0:
        return program
    prompted_pre = prompted_pre_post.splitlines()[0]
    try:
        prompted_post = prompted_pre_post.splitlines()[1]
    except Exception as e:
        print(str(e))
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
    file: str = "bpftrace_z3.json",
) -> object:
    """
    prompt the current codedb and return the pre condition and post conditino json
    """
    # get format promt from

    # has db
    json_template = ""
    json_ = json.load(open("z3_vector_db/data/" + file, "r"))
    for li in list(json_[0].keys()):
        if li == function:
            json_template = json_[0][li]
    program_name = "bpftrace" if file.__contains__("bpftrace") else "libbpf"
    prompt = (
        f"""
    I'm working on a project involving writing {program_name} programs 
    and I just got the job of {context}, in my coded program:
    "{program}" 
    line {linenumber}, {function}, I need to verify based on the context of what I ask, 
    can you provide some refined constraints information on this line 
    considering the context. 
    """
        + (
            f"Here's the broader constraints of this function: {json_template['description']} with pre condition {', '.join(map(lambda kv: f'{kv[0]} should be {kv[1]}', json_template['pre'].items()))}"
            if json_template != ""
            else ""
        )
        + f"""
    You should generate the refined constraints in following C format:
    ```c
      assume([]);
      sassert([]);
    ```
    The requirement is to put the pre condition to the correstponding [] which assume will be inserted in line {(linenumber+2)}, sassert will be inserted in the end of the function {function} and should comply the c definitoin so that all the variable is defined in the context and should pass bpftrace compiler. You only need to provide the pre condition in one line and post condition in one line if there are multiple of them you should use & to connect them.
    """
        + get_argument_prompt(function)
    )
    print("\nkprobe prompts\n", prompt)

    response = generate_response(prompt)
    print("\nkprobe responses", response)
    code_pattern = r"```c\n(.*?)\n```"
    c_code = re.findall(code_pattern, response, re.DOTALL)
    if not c_code or c_code.__contains__("assume") or c_code.__contains__("sassert"):
        c_code = ""
    else:
        c_code = c_code[0]

    print(c_code, "\n\n")
    return c_code


def verify_z3(program) -> str:
    """
    compile the result gives sat/unsat

    return error string or empty str.
    """
    print("\nstart verify with z3: \n")
    with open("/tmp/tmp.ll", "w") as f:
        f.write(program)
    os.system("z3_vector_db/seahorn/bin/sea smt /tmp/tmp.ll -o /tmp/tmp.smt2")
    try:
        sat = subprocess.run(
            [
                "z3",
                "/tmp/tmp.smt2",
            ],
            text=True,
            capture_output=True,
        )
        if sat.stdout.__contains__("sat"):
            return ""
        else:
            return f"stdout: {sat.stdout}\nstderr: {sat.stderr}\n"
    except Exception as e:
        print("error in verify z3")
        return str(e)


def get_linenumber(output_string: str):
    return 0


def compile_bpftrace_for_llvm(program: str):
    with open("/tmp/tmp.bt", "w") as f:
        f.write(program)
    # try:
    var = subprocess.run(
        [
            "sudo",
            "z3_vector_db/bpftrace/bpftrace",
            "-d",
            "/tmp/tmp.bt",
        ],
        text=True,
        capture_output=True,
    )
    return var


def retry_generate_bpftrace_program_for_compile(program: str, error: str) -> str:
    retry_prompt = f"""
The bpftrace program below:

{program}

has compile error, please fix it without change it's behavior
or remove assume statement. only do mininium modification if required.

{error}

We are going to use smt tools to verify the code, so please
REMEMBER to keep the assume or assert statement to make sure it can be verified.
If assume statement exists, do not change it to if or other statements.
"""
    print("\nretry_generate_bpftrace_program_for_compile: \n", retry_prompt)
    response = run_gpt_for_bpftrace_func(retry_prompt, "gpt-4")
    return response


def retry_generate_bpftrace_program_for_sat(context: str, program: str, error: str) -> str:
    retry_prompt = f"""
The bpftrace program below is use to {context}

{program}

has sat error. if the error is related to the program itself, please fix it.

{error}

use function to run the bpftrace program without any assume or assert statments.
"""
    print("\nretry_generate_bpftrace_program_for_sat\n", retry_prompt)
    response = run_gpt_for_bpftrace_func(retry_prompt, "gpt-4")
    return response


def compile_bpftrace_with_retry(context, program, retry_depth=3):
    print("compile_bpftrace_with_retry")
    var = compile_bpftrace_for_llvm(program)
    # print(var)
    # parce from the normal function to result
    if var.returncode != 0:
        print("\nvar.stderr: ", var.stderr)
        print("\nretry left: ", retry_depth)
        if retry_depth <= 0:
            print("\nfailed to compile bpftrace program with retry.\n")
            return "", program
        program = retry_generate_bpftrace_program_for_compile(program, var.stderr)
        print("\nregenerated program:\n", program)
        return compile_bpftrace_with_retry(
            context,
            program,
            retry_depth - 1,
        )
    else:
        stdout = var.stdout
        stdout = stdout.replace('@__SEA_assume(i1 %0)', '@__SEA_assume(i64 %0)')
        return stdout, program


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
    program_lines = program.splitlines()
    # try:
    for linenumber, line in enumerate(program_lines):
        print(linenumber, line)
        if line.strip() == "":
            continue
        for match in function_matches:
            if match.startswith(line.strip()):
                # try:
                print(line, "line", match)
                program_tmp = program
                program = get_bpf_prompt(context, program, line, linenumber)
                program_ll, _ = compile_bpftrace_with_retry(
                    context, program
                )
                res = verify_z3(program_ll)
                # regenerate the program if contains error:
                if res != "":
                    program = retry_generate_bpftrace_program_for_sat(context, program_tmp, res)
                else:
                    program = program_tmp
                # except:
                #     print("error in geting the smt")
        for match in kprobe_matches:
            if match.startswith(line.strip()):
                program_tmp = program
                program = get_kprobe_prompt(context, program, line, linenumber)
                print("\nkprobe_matches, after get_kprobe_prompt program:\n", program)
                program_ll, _ = compile_bpftrace_with_retry(
                    context, program
                )
                parts = program_ll.split("ModuleID")
                if len(parts) <= 1:
                    continue
                substring = "; ModuleID " + parts[1].strip()
                res = verify_z3(substring)
                # regenerate the program if contains error:
                if res != "":
                    program = retry_generate_bpftrace_program_for_sat(context, program_tmp, res)
                else:
                    program = program_tmp
    # except:
    #     pass
    return program


def parse_libbpf_program(context: str, program: str):
    """
    parse one program, the libbpf will first compile, the compiler has the assume for z3 to verify
    Args:
        context: The context is for the current context
        program:

    Returns:

    """
    function_matches = re.findall(r"\w+\([^)]*\)", program)
    print(function_matches)
    print(function_matches)
    uprobe_matches = re.findall(r"uretprobe:.+", program)
    kprobe_matches = re.findall(r"kprobe:.+", program)
    kretprobe_matches = re.findall(r"kretprobe:.+", program)
    print(kprobe_matches)

    tracepoint_matches = re.findall(r"tracepoint:.+", program)
    # try:
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
                program_ll, _ = compile_bpftrace_with_retry(
                    context, program
                )
                res = verify_z3(program_ll)
                # regenerate the program if contains error:
                if res != "":
                    program = retry_generate_bpftrace_program_for_sat(context, program_tmp, res)
                else:
                    # restore the original program
                    program = program_tmp
        for match in kprobe_matches:
            if match.startswith(line.strip()):
                program_tmp = program
                program = get_kprobe_prompt(context, program, line, linenumber)
                print("program\n", program)
                program_ll, _ = compile_bpftrace_with_retry(
                    context, program
                )
                parts = program_ll.split("ModuleID")
                substring = "; ModuleID " + parts[1].strip()
                res = verify_z3(substring)
                # regenerate the program if contains error:
                if res != "":
                    program = retry_generate_bpftrace_program_for_sat(context, program_tmp, res)
                else:
                    program = program_tmp
    # except:
    #     pass
    return program


# extract all the function calls
# prompt from the vectordb and gen
def run_bpftrace_verifier(context: str, program: str) -> str:
    # make sure the program can be compile by bpftrace.
    # retry 3 times to generate correct program
    _, new_program = compile_bpftrace_with_retry(context, program)
    # make sure it can be compile
    test_new = compile_bpftrace_for_llvm(new_program)
    if test_new.returncode != 0:
            return program
    # run the verifier to modify the program
    res = parse_bpftrace_program(context, new_program)
    if not res:
        return program
    # test for compile again
    var = compile_bpftrace_for_llvm(res)
    if var.returncode != 0:
        # test for correct compile program
        return new_program
    return res


def test_libbpf_verifer():
    context = "This libbpf (Berkeley Packet Filter) program tracks and increments the number of SYN segments received by IPv4 and IPv6 TCP sockets, effectively monitoring the TCP SYN backlog on the system."
    program = """
#include <vmlinux.h>
#include <bpf/bpf_helpers.h>
#include <bpf/bpf_tracing.h>
#include <bpf/bpf_core_read.h>
#include "maps.bpf.h"

#define BUCKET_MULTIPLIER 50
#define BUCKET_COUNT 20

struct {
    __uint(type, BPF_MAP_TYPE_HASH);
    __uint(max_entries, BUCKET_COUNT + 2);
    __type(key, u64);
    __type(value, u64);
} tcp_syn_backlog SEC(".maps");

static int do_count(u64 backlog)
{
    u64 bucket = backlog / BUCKET_MULTIPLIER;

    increment_map(&tcp_syn_backlog, &bucket, 1);
    increment_map(&tcp_syn_backlog, &bucket, backlog);

    return 0;
}

SEC("kprobe/tcp_v4_syn_recv_sock")
int BPF_KPROBE(kprobe__tcp_v4_syn_recv_sock, struct sock *sk)
{
    return do_count(BPF_CORE_READ(sk, sk_ack_backlog) / 50);
}

SEC("kprobe/tcp_v6_syn_recv_sock")
int BPF_KPROBE(kprobe__tcp_v6_syn_recv_sock, struct sock *sk)
{
    return do_count(BPF_CORE_READ(sk, sk_ack_backlog) / 50);
}

char LICENSE[] SEC("license") = "GPL";
"""
    parse_libbpf_program(context, program)


class CommandResult(TypedDict):
    command: str
    stdout: str
    stderr: str
    returncode: int


if __name__ == "__main__":
    context = ""
    program = ""
    with open("program.bt", "r") as file:
        program = file.read()
    with open("context.txt", "r") as file:
        context = file.read()
    res = run_bpftrace_verifier(context, program)
    with open("result.bt", "w") as file:
        file.write(res)
    # test_libbpf_verifer()
