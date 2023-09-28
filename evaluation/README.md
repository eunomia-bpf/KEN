# evaluation for KEN

## evaluation cases

use llm and vector data base examples to generate eBPF programs:

1. few shot with basic eBPF examples
2. few shot with vector database

use retry for hook points:

1. few shot with basic eBPF examples with 3 retries
2. few shot with vector database with 3 retries

## run evaluation

```sh
python3 eval.py
```

or test with output redirect:

```sh
time python3 eval.py > few_shot_3trails_and_smt-gpt4.txt 2>&1
```

## test cases

- test_cases.txt: test cases for evaluation, one case per line
- test_cases_human_info.txt: additional information for each test case, provided by human and can be used for retry

## results

see records/README.md

## monitor

```
trails.
        Please retry generating the bpftrace program for: Trace md flush events with pid and process name
 And fix the error.
                    

                    [{'generated_text': 'Generate a eBPF program Traces process signals and logs the signal names and process IDs affected.\n\n### Usage\n\n```\n#./ebpf_signal_trace\n```\n\n### Output\n\n```\nSignal: SIGINT\nProcess ID: 12345\nSignal: SIGINT\nProcess ID: 12345\nSignal: SIGINT\nProcess ID: 12345\nSignal: SIGINT\nProcess ID: 12345\nSignal: SIGINT\nProcess ID: 12345\nSignal: SIGINT\nProcess ID: 12345\nSignal: SIGINT\nProcess ID: 12345\nSignal: SIGINT\nProcess ID: 12345\nSignal: SIGINT\nProcess ID: 12345\nSignal: SIGINT\nProcess ID: 12345\nSignal: SIGINT\nProcess ID: 12345\nSignal: SIGINT\nProcess ID: 12345\nSignal: SIGINT\nProcess ID: 12345\nSignal: SIGINT\nProcess ID: 12345\nSignal: SIGINT\nProcess ID: 12345\nSignal: SIGINT\nProcess ID: 12345\nSignal: SIGINT\nProcess ID: 12345\nSignal: SIGINT\nProcess ID: 12345\nSignal: SIGINT\nProcess ID: 12345\nSignal: SIGINT\nProcess ID: 12345\nSignal: SIGINT\nProcess ID: 12345\nSignal: SIGINT\nProcess ID: 12345\nSignal: SIGINT\nProcess ID: 12345\nSignal: SIGINT\nProcess ID: 12345\nSignal: SIGINT\nProcess ID: 12345\nSignal: SIGINT\nProcess ID: 12345\nSignal: SIGINT\nProcess ID: 12345\nSignal: SIGINT\nProcess ID: 12345\nSignal: SIGINT\nProcess ID: 12345\nSignal: SIGINT\nProcess ID: 12345\nSignal: SIGINT\nProcess ID: 12345\nSignal: SIGINT\nProcess ID: 12345\nSignal: SIGINT\nProcess ID: 12345\nSignal: SIGINT\nProcess ID: 12345\nSignal: SIGINT\nProcess ID: 12345\nSignal: SIGINT\nProcess ID: 12345\nSignal: SIGINT\nProcess ID: 12345\nSignal: SIGINT\nProcess ID: 12345\nSignal: SIGINT\nProcess ID: 12345\nSignal: SIGINT\nProcess ID: 12345\nSignal: SIGINT\nProcess ID: 12345\nSignal: SIGINT\nProcess ID: 12345\nSignal: SIGINT\nProcess ID: 12345\nSignal: SIGINT\nProcess ID: 12345\nSignal: SIGINT\nProcess ID: 12345\nSignal: SIGINT\nProcess ID: 12345\nSignal: SIGINT\nProcess ID: 12345\nSignal: SIGINT\nProcess ID: 12345\nSignal: SIGINT\nProcess ID: 12345\nSignal: SIGINT\nProcess ID: 12345\nSignal: SIGINT\nProcess ID: 12345\nSignal: SIGINT\nProcess ID: 12345\nSignal: SIGINT\nProcess ID: 12345\nSignal: SIGINT\nProcess ID: 12345\nSignal: SIGINT\nProcess ID: 12345\nSignal: SIGINT\nProcess ID: 12345\nSignal: SIGINT\nProcess ID: 12345\nSignal: SIGINT\nProcess ID: 12345\nSignal: SIGINT\nProcess ID'}]
                                                                                    The bpf program to run is: sudo timeout --preserve-status -s 2 20 bpftrace -e #./ebpf_signal_trace
                                                                              kill process 590011
                                                                                                 {"command": "sudo timeout --preserve-status -s 2 20 bpftrace -e #./ebpf_signal_trace", "stdout": "", "stderr": "stdin:1:21-21: ERROR: unexpected end of file, expected {\n#./ebpf_signal_trace\n                    \n", "returncode": 1}
                  {"command": "sudo timeout --preserve-status -s 2 20 bpftrace -e #./ebpf_signal_trace", "stdout": "", "stderr": "stdin:1:21-21: ERROR: unexpected end of file, expected {\n#./ebpf_signal_trace\n                    \n", "returncode": 1, "prompt": "\nWrite a bpftrace program that traces or profile the following user request:\n\n### User Request\n\nTrace md flush events with pid and process name\n\n### Examples\n\nHere are some simple examples to help you get started with bpftrace:\n\n\nBelow are some simple examples of bpftrace programs:\n\ntrace processes calling sleep:\n```\nkprobe:do_nanosleep { printf(\"PID %d sleeping...\", pid); }\n```\n\ncount syscalls by process name:\n```\ntracepoint:raw_syscalls:sys_enter { @[comm] = count(); }\n```\n\nFiles opened by process:\n```\ntracepoint:syscalls:sys_enter_open { printf(\"%s %s\", comm, str(args->filename)); }\n```\n\nSyscall count by program:\n```\ntracepoint:raw_syscalls:sys_enter { @[comm] = count(); }\n```\n\nRead bytes by process:\n```\ntracepoint:syscalls:sys_exit_read /args->ret/ { @[comm] = sum(args->ret); }\n```\n\nRead size distribution by process:\n```\ntracepoint:syscalls:sys_exit_read { @[comm] = hist(args->ret); }\n```\n\nShow per-second syscall rates:\n```\ntracepoint:raw_syscalls:sys_enter { @ = count(); } interval:s:1 { print(@); clear(@); }\n```\n\nTrace disk size by process:\n```\ntracepoint:block:block_rq_issue { printf(\"%d %s %d\", pid, comm, args->bytes); }\n```\n\nCount page faults by process\n```\nsoftware:faults:1 { @[comm] = count(); }\n```\n\nCount LLC cache misses by process name and PID (uses PMCs):\n```\nhardware:cache-misses:1000000 { @[comm, pid] = count(); }\n```\n\nProfile user-level stacks at 99 Hertz, for PID 189:\n```\nprofile:hz:99 /pid == 189/ { @[ustack] = count(); }\n```\n\nFiles opened, for processes in the root cgroup-v2\n```\ntracepoint:syscalls:sys_enter_openat /cgroup == cgroupid(\"/sys/fs/cgroup/unified/mycg\")/ { printf(\"%s\", str(args->filename)); }\n```\n\ntcp connect events with PID and process name\n```\nkprobe:tcp_connect { printf(\"connected from pid %d, comm %s\", pid, comm); }\n```\n\n\nHere are some complex examples may be related to your user request:\n\nexample: Write a BPF code that traces md flush events and displays the time, process ID, command, and device information of each event.\n\n```\n#ifndef BPFTRACE_HAVE_BTF\n#include <linux/genhd.h>\n#include <linux/bio.h>\n#endif\n\nBEGIN\n{\n\tprintf(\"Tracing md flush events... Hit Ctrl-C to end.\\n\");\n\tprintf(\"%-8s %-6s %-16s %s\\n\", \"TIME\", \"PID\", \"COMM\", \"DEVICE\");\n}\n\nkprobe:md_flush_request\n{\n\ttime(\"%H:%M:%S \");\n\tprintf(\"%-6d %-16s %s\\n\", pid, comm,\n\t    ((struct bio *)arg1)->bi_bdev->bd_disk->disk_name);\n}\n\n```\n\nexample: Write a BPF code that traces sync-related system calls, such as sync(), syncfs(), fsync(), and fdatasync(), and prints the time, process ID, command, and event for each traced system call.\n\n```\nBEGIN\n{\n\tprintf(\"Tracing sync syscalls... Hit Ctrl-C to end.\\n\");\n\tprintf(\"%-9s %-6s %-16s %s\\n\", \"TIME\", \"PID\", \"COMM\", \"EVENT\");\n}\n\ntracepoint:syscalls:sys_enter_sync,\ntracepoint:syscalls:sys_enter_syncfs,\ntracepoint:syscalls:sys_enter_fsync,\ntracepoint:syscalls:sys_enter_fdatasync,\ntracepoint:syscalls:sys_enter_sync_file_range*,\ntracepoint:syscalls:sys_enter_msync\n{\n\ttime(\"%H:%M:%S  \");\n\tprintf(\"%-6d %-16s %s\\n\", pid, comm, probe);\n}\n\n```\n\n\nYou can refer to the above examples to write your own bpftrace program to help user with:\n\nTrace md flush events with pid and process name\n\nUse a tool provided to execute your bpftrace program.\nYou should only write the bpftrace program itself.\n\nRun the bpftrace program\n```\n #./ebpf_signal_trace\n```\nwith the following error and ouput:\n```\nstdin:1:21-21: ERROR: unexpected end of file, expected {\n#./ebpf_signal_trace\n                    \n\n```\nThis is your trail 1 out of 3 trails.\nPlease retry generating the bpftrace program for: Trace md flush events with pid and process name\nAnd fix the error.\n\nRun the bpftrace program\n```\n #./ebpf_signal_trace\n```\nwith the following error and ouput:\n```\nstdin:1:21-21: ERROR: unexpected end of file, expected {\n#./ebpf_signal_trace\n                    \n\n```\nThis is your trail 2 out of 3 trails.\nPlease retry generating the bpftrace program for: Trace md flush events with pid and process name\nAnd fix the error.\n\nRun the bpftrace program\n```\n #./ebpf_signal_trace\n```\nwith the following error and ouput:\n```\nstdin:1:21-21: ERROR: unexpected end of file, expected {\n#./ebpf_signal_trace\n                    \n\n```\nThis is your trail 3 out of 3 trails.\nPlease retry generating the bpftrace program for: Trace md flush events with pid and process name\nAnd fix the error.\n"}

real    22m0.315s
user    13m28.816s
sys     8m27.571s
```