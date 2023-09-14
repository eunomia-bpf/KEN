import bpftrace

prog = """
#ifndef BPFTRACE_HAVE_BTF
#include <linux/genhd.h>
#include <linux/bio.h>
#endif

BEGIN
{
	printf("Tracing md flush events... Hit Ctrl-C to end.\n");
	printf("%-8s %-6s %-16s %s\n", "TIME", "PID", "COMM", "DEVICE");
}

kprobe:md_flush_request
{
	time("%H:%M:%S ");
	printf("%-6d %-16s %s\n", pid, comm,
	    ((struct bio *)arg1)->bi_bdev->bd_disk->disk_name);
}

"""

res = bpftrace_run_program(prog)
print(res)
