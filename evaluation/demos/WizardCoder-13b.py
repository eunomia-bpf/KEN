# Use a pipeline as a high-level helper
from transformers import pipeline

pipe = pipeline("text-generation",
                model="WizardLM/WizardCoder-Python-13B-V1.0", 
                device_map="auto", 
                batch_size=1, 
                max_new_tokens=1024)

prompt = """
You should Write a bpftrace program that traces or profile the
following user request: Traces process signals and logs the signal names and process IDs affected.


Below are some simple examples of bpftrace programs:

trace processes calling sleep:
```
kprobe:do_nanosleep { printf("PID %d sleeping...", pid); }
```

count syscalls by process name:
```
tracepoint:raw_syscalls:sys_enter { @[comm] = count(); }
```

Files opened by process:
```
tracepoint:syscalls:sys_enter_open { printf("%s %s", comm, str(args->filename)); }
```

Syscall count by program:
```
tracepoint:raw_syscalls:sys_enter { @[comm] = count(); }
```

Read bytes by process:
```
tracepoint:syscalls:sys_exit_read /args->ret/ { @[comm] = sum(args->ret); }
```

Read size distribution by process:
```
tracepoint:syscalls:sys_exit_read { @[comm] = hist(args->ret); }
```

Show per-second syscall rates:
```
tracepoint:raw_syscalls:sys_enter { @ = count(); } interval:s:1 { print(@); clear(@); }
```

Trace disk size by process:
```
tracepoint:block:block_rq_issue { printf("%d %s %d", pid, comm, args->bytes); }
```

Count page faults by process
```
software:faults:1 { @[comm] = count(); }
```

Count LLC cache misses by process name and PID (uses PMCs):
```
hardware:cache-misses:1000000 { @[comm, pid] = count(); }
```

Profile user-level stacks at 99 Hertz, for PID 189:
```
profile:hz:99 /pid == 189/ { @[ustack] = count(); }
```

Files opened, for processes in the root cgroup-v2
```
tracepoint:syscalls:sys_enter_openat /cgroup == cgroupid("/sys/fs/cgroup/unified/mycg")/ { printf("%s", str(args->filename)); }
```

tcp connect events with PID and process name
```
kprobe:tcp_connect { printf("connected from pid %d, comm %s", pid, comm); }
```



	Here are some more complex examples may be related to your user request:

	example: Please write a BPF code that traces signals issued by the kill() syscall and prints information such as the timestamp, process ID, command, signal, target process ID, and the result of the kill() syscall.

```
BEGIN
{
	printf("Tracing kill() signals... Hit Ctrl-C to end.\n");
	printf("%-9s %-6s %-16s %-4s %-6s %s\n", "TIME", "PID", "COMM", "SIG",
	    "TPID", "RESULT");
}

tracepoint:syscalls:sys_enter_kill
{
	@tpid[tid] = args.pid;
	@tsig[tid] = args.sig;
}

tracepoint:syscalls:sys_exit_kill
/@tpid[tid]/
{
	time("%H:%M:%S  ");
	printf("%-6d %-16s %-4d %-6d %d\n", pid, comm, @tsig[tid], @tpid[tid],
	    args.ret);
	delete(@tpid[tid]);
	delete(@tsig[tid]);
}

```

example: Write a BPF code that counts the number of system calls and the number of processes. It also prints the top 10 system call IDs and the top 10 processes at the end.

```
BEGIN
{
	printf("Counting syscalls... Hit Ctrl-C to end.\n");
	// ausyscall --dump | awk 'NR > 1 { printf("\t@sysname[%d] = \"%s\";\n", $1, $2); }'
}

tracepoint:raw_syscalls:sys_enter
{
	@syscall[args.id] = count();
	@process[comm] = count();
}

END
{
	printf("\nTop 10 syscalls IDs:\n");
	print(@syscall, 10);
	clear(@syscall);

	printf("\nTop 10 processes:\n");
	print(@process, 10);
	clear(@process);
}

```

	
	### possible related hook locations
	tracepoint:syscalls:sys_enter_kill


	Note: these hooks may not be correct for the user request,
	it's just for reference.
		
## hints 
The most probable hook location for tracing process signals and logging the signal names and process IDs affected would be the `tracepoint:syscalls:sys_enter_kill` and `tracepoint:syscalls:sys_exit_kill`. The desired bpftrace program logic would involve capturing the signal and target process ID at the syscall entry, and then logging these details along with the process ID and command at the syscall exit.
You can refer to the above examples and hints to
write your own bpftrace program to help user with:

Traces process signals and logs the signal names and process IDs affected.

Use a tool provided to execute your bpftrace program.
No explain and no instructions. No extra words of description other 
than bpftrace program. No need to write the bpftrace command, only the program itself.
Make sure the program can be run with bpftrace, keep the eBPF program short and clear
to avoid more mistakes.
"""

res = pipe(prompt)
print(res)
print(res[0]['generated_text'])