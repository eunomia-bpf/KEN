from cProfile import label
import numpy as np
from scipy import stats
from time import time
from matplotlib import style
import matplotlib.pyplot as plt
from statistics import mean
from sympy import print_glsl
import pandas as pd
style.use('ggplot')

formated_file_list = ["tracepoint:irq:irq_handler_entry","tracepoint:sched:sched_process_fork","kprobe:__kmalloc","kprobe:do_prlimit","tracepoint:signal:signal_deliver","tracepoint:raw_syscalls:sys_exit","kprobe:tcp_v4_syn_recv_sock","tracepoint:raw_syscalls:sys_enter1","tracepoint:raw_syscalls:sys_enter2","tracepoint:syscalls:sys_enter_socket","tracepoint:syscalls:sys_enter_openat","tracepoint:syscalls:sys_enter_read","kprobe:net_namespace","tracepoint:syscalls:sys_enter_open","hardware:cache","tracepoint:exceptions:page_fault_user","uretprobe:/bin/bash:readline","kprobe:d_lookup","kprobe:md_flush_request","tracepoint:sched:sched_switch1","tracepoint:sched:sched_switch1","uprobe:libpthread:pthread_create","hardware:kvm_exit","tracepoint:syscalls:sys_enter_mount","kprobe:bpf_int_jit_compile","kprobe:__blk_account_io_done","kprobe:btrfs_file_write_iter","kprobe:cap_capable","kprobe:compact_zone","kprobe:preempt_schedule_irq","tracepoint:syscalls:sys_enter_kill","kprobe:mutex_lock","tracepoint:syscalls:sys_enter_shmget","kprobe:kmem_cache_alloc","tracepoint:syscalls:sys_enter_sync","kprobe:tcp_rcv_established","kprobe:zpl","kprobe:swap_readpage","kprobe:tcp_v4_connect","kprobe:xfs_file_read"]# doing
result1 = np.zeros((2, 40))
N = 100


def plot_TS_expect(result, *name):
    for i in range(len(name)):
        plt.figure(figsize=(16, 9))
        # plt.ylim([0, 20000])
        df = pd.DataFrame(result[i])
        fig = px.line(df, title="The graph for scaled "+name[i])
        fig.write_html(name[i]+".html")


def get_data(result, file_list):
    for file_idx, file in enumerate(file_list):
        try:
            f = open(file, "r").readlines()
            for line in f:
                pass
        except Exception as err:
            print(err)
    return result


print(formated_file_list)
result = get_data(result1, formated_file_list)
print(result)
plot_TS_expect(result, "SPP Comparison")