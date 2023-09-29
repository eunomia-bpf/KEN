import os
import subprocess
from cProfile import label
import numpy as np
from scipy import stats
from time import time
from matplotlib import style
import matplotlib.pyplot as plt
from statistics import mean
import seaborn as sns
import pandas as pd

formatted_file_list = ["tracepoint:irq:irq_handler_entry","tracepoint:sched:sched_process_fork","kprobe:__kmalloc","kprobe:do_prlimit","tracepoint:signal:signal_deliver","tracepoint:raw_syscalls:sys_exit","kprobe:tcp_v4_syn_recv_sock","tracepoint:raw_syscalls:sys_enter1","tracepoint:raw_syscalls:sys_enter2","tracepoint:syscalls:sys_enter_socket","tracepoint:syscalls:sys_enter_openat","tracepoint:syscalls:sys_enter_read","kprobe:net_namespace","tracepoint:syscalls:sys_enter_open","hardware:cache","tracepoint:exceptions:page_fault_user","uretprobe:/bin/bash:readline","kprobe:d_lookup","kprobe:md_flush_request","tracepoint:sched:sched_switch1","tracepoint:sched:sched_switch2","uprobe:libpthread:pthread_create","hardware:kvm_exit","tracepoint:syscalls:sys_enter_mount","kprobe:bpf_int_jit_compile","kprobe:__blk_account_io_done","kprobe:btrfs_file_write_iter","kprobe:cap_capable","kprobe:compact_zone","kprobe:preempt_schedule_irq","tracepoint:syscalls:sys_enter_kill","kprobe:mutex_lock","tracepoint:syscalls:sys_enter_shmget","kprobe:kmem_cache_alloc","tracepoint:syscalls:sys_enter_sync","kprobe:tcp_rcv_established","kprobe:zpl","kprobe:swap_readpage","kprobe:tcp_v4_connect","kprobe:xfs_file_read"]
cate1 = ["kprobe","uprobe","tracepoint"]
cate2 = ["application","syscall","network","fs","hardware"]
names=["Pixel Kernel", "Brandon Dataset", "EBPFNLDataset","all"]
colors=["#e7e1ef","#c994c7","#dd1c77","#fde0dd","#c51b8a","cyan","pink"]
def get_pipe3(cmd1,cmd2,cmd3):
    # Set up the first subprocess
    p1 = subprocess.Popen(cmd1, stdout=subprocess.PIPE, stderr=subprocess.PIPE)

    # Set up the second subprocess, taking the stdout from the first subprocess as its stdin
    p2 = subprocess.Popen(cmd2, stdin=p1.stdout, stdout=subprocess.PIPE, stderr=subprocess.PIPE)

    # We can close the stdout of p1. This is important in avoiding deadlocks.
    p1.stdout.close()

    # Set up the third subprocess, taking the stdout from the second subprocess as its stdin
    p3 = subprocess.Popen(cmd3, stdin=p2.stdout, stdout=subprocess.PIPE, stderr=subprocess.PIPE)

    # Again, we can close the stdout of p2.
    p2.stdout.close()

    # Obtain the final output from the stdout of the last subprocess in the chain
    output, errors = p3.communicate()

    # Decode the output and strip any leading/trailing whitespace
    result = output.decode('utf-8').strip()

    return int(result)

def get_pipe4(cmd1,cmd2,cmd3,cmd4):
    # Set up the first subprocess
    p1 = subprocess.Popen(cmd1, stdout=subprocess.PIPE, stderr=subprocess.PIPE)

    # Set up the second subprocess
    p2 = subprocess.Popen(cmd2, stdin=p1.stdout, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    p1.stdout.close()  # Avoid deadlocks by closing p1's stdout

    # Set up the third subprocess
    p3 = subprocess.Popen(cmd3, stdin=p2.stdout, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    p2.stdout.close()  # Avoid deadlocks by closing p2's stdout

    # Set up the fourth subprocess
    p4 = subprocess.Popen(cmd4, stdin=p3.stdout, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    p3.stdout.close()  # Avoid deadlocks by closing p3's stdout

    # Get the output
    output, errors = p4.communicate()

    # Decode the output and strip any leading/trailing whitespace
    result = output.decode('utf-8').strip()

    return int(result)

def make_percentage(result):
    for i in range(len(result)):
        for j in range(len(result[i])):
            result[i][j] = result[i][j]/sum(result[i])*100

    return result
# https://source.android.com/docs/core/architecture/kernel/bpf
def clone_pixel_kernel():
    os.system("mkdir -p pixel_kernel")
    os.chdir("pixel_kernel")
    os.system("repo init -u https://android.googlesource.com/kernel/manifest -b android-gs-raviole-5.10-android13-qpr2")
    os.system("repo sync -j$(nproc --all)")

# https://source.android.com/docs/core/architecture/kernel/bpf
def clone_raviole_kernel():
    os.system("git clone https://android.googlesource.com/device/google/raviole-kernel/")

# pixel
def get_kprobe_pixel_kernel()->int:
    return get_pipe3(["git","log"],["grep", "kprobe"],["wc", "-l"])

def get_uprobe_pixel_kernel()->int:
    return get_pipe3(["git","log"],["grep", "uprobe"],["wc", "-l"])

def get_tracepoint_pixel_kernel()->int:
    return get_pipe3(["git","log"],["grep", "tracepoint"],["wc", "-l"])

def get_application_pixel_kernel()->int:
    return get_pipe4(["git","log"],["grep", "bpf"],["grep", "bpf"],["wc", "-l"])

def get_syscall_pixel_kernel()->int:
    return get_pipe4(["git","log"],["grep", "syscall"],["grep","sys"],["wc", "-l"])

def get_network_pixel_kernel()->int:
    return get_pipe3(["git","log"],["grep", "net-bpf"],["wc", "-l"]) + get_pipe4(["git","log"],["grep", "bpf"],["grep","sock"],["wc", "-l"])

def get_fs_pixel_ebpf_rules()->int:
    return get_pipe3(["git","log"],["grep", "fuse-bpf"],["wc", "-l"]) + get_pipe4(["git","log"],["grep", "bpf"],["grep","storage"],["wc", "-l"]) 

def get_hardware_pixel_ebpf_rules()->int:
    return get_pipe3(["git","log"],["grep", "hwmon"],["wc", "-l"]) + get_pipe4(["git","log"],["grep", "bpf"],["grep","-i","arm64"],["wc", "-l"])

# greggs brandon
def get_kprobe_brandon_dataset()->int:
    os.system("cat bpftrace/*.bt|grep kprobe:|wc -l")
    os.system("cat bpftrace/*.bt|grep kretprobe:|wc -l")
    os.system("cat libbpf/*.c|grep kprobe|wc -l")
    os.system("cat libbpf/*.c|grep kretprobe|wc -l")
    return 35+6+19+3

def get_uprobe_brandon_dataset()->int:
    os.system("cat bpftrace/*.bt|grep uprobe:|wc -l")
    os.system("cat bpftrace/*.bt|grep uretprobe:|wc -l")
    os.system("cat libbpf/*.c|grep uprobe|wc -l")
    os.system("cat libbpf/*.c|grep uretprobe|wc -l")
    return 29+28+4+1

def get_tracepoint_brandon_dataset()->int:
    os.system("cat bpftrace/*.bt|grep tracepoint:|wc -l")
    os.system("cat libbpf/*.c|grep tracepoint|wc -l")
    return 41+13


def plot_TS_expect(result1,result2,cate1,cate2):
    num_names = len(names)
        
    # Initialize a figure with 40 subplots arranged in a grid
    fig, axes = plt.subplots(1, 2, figsize=(20, 10))

    # Flatten the axes array to make indexing easier
    axes = axes.flatten()
    for i in range(len(cate1)):
        bar_width = 0.1  # width of the bars
        r = np.arange(len(result1))  # the label locations
        
        # Plotting bars
        axes[0].bar(r + i*bar_width, result1[:, i], width=bar_width, color=colors[i], label=cate1[i])
        
    # Customize x-axis
    axes[0].set_xticks(r + bar_width/2)
    axes[0].set_xticklabels(names)
    axes[0].set_title("Trace Type")
    axes[0].set_ylabel("Percentage")

    # Plot for cate2
    for i in range(len(cate2)):
        bar_width = 0.1  # width of the bars
        r = np.arange(len(result2))  # the label locations
        
        # Plotting bars
        axes[1].bar(r + i*bar_width, result2[:, i], width=bar_width, color=colors[i], label=cate2[i])
        
    # Customize x-axis
    axes[1].set_xticks(r + bar_width/2)
    axes[1].set_xticklabels(names)
    axes[1].set_title("Category")
    axes[1].set_ylabel("Percentage")
    plt.tight_layout()
    plt.show()

if __name__ == "__main__":
    # if not os.path.exists("pixel_kernel"):
    #     clone_pixel_kernel()
    # if not os.path.exists("raviole-kernel"):
    #     clone_raviole_kernel()
    result_cate1=np.zeros((1, 3))
    result_cate2=np.zeros((1, 5))
    # os.chdir("raviole-kernel")
    # print("get_kprobe_pixel_kernel")
    # print(get_kprobe_pixel_kernel())
    # result_cate1[0][0] = get_kprobe_pixel_kernel()

    # print("get_uprobe_pixel_kernel")
    # print(get_uprobe_pixel_kernel())
    # result_cate1[0][1] = get_uprobe_pixel_kernel()

    # print("get_tracepoint_pixel_kernel")
    # print(get_tracepoint_pixel_kernel())
    # result_cate1[0][2] = get_tracepoint_pixel_kernel()

    # print("get_application_pixel_kernel")
    # print(get_application_pixel_kernel())
    # result_cate2[0][0] = get_application_pixel_kernel()

    # print("get_syscall_pixel_kernel")
    # print(get_syscall_pixel_kernel())
    # result_cate2[0][1] = get_syscall_pixel_kernel()

    # print("get_network_pixel_kernel")
    # print(get_network_pixel_kernel())
    # result_cate2[0][2] = get_network_pixel_kernel()

    # print("get_fs_pixel_ebpf_rules")
    # print(get_fs_pixel_ebpf_rules())
    # result_cate2[0][3] = get_fs_pixel_ebpf_rules()

    # print("get_hardware_pixel_ebpf_rules")
    # print(get_hardware_pixel_ebpf_rules())
    # result_cate2[0][4] = get_hardware_pixel_ebpf_rules()

    # os.chdir("../../../dataset/")
    # print("get_kprobe_brandon_dataset")
    # print(get_kprobe_brandon_dataset())
    # result_cate1[1][0] = get_kprobe_brandon_dataset()

    # print("get_uprobe_brandon_dataset")
    # print(get_uprobe_brandon_dataset())
    # result_cate1[1][1] = get_uprobe_brandon_dataset()

    # print("get_tracepoint_brandon_dataset")
    # print(get_tracepoint_brandon_dataset())
    # result_cate1[1][2] = get_tracepoint_brandon_dataset()

    # print("get_application_brandon_ebpf_rules")
    # result_cate2[1][0] = 8

    # print("get_syscall_brandon")
    # result_cate2[1][1] = 7

    # print("get_network_brandon")
    # result_cate2[1][2] = 14

    # print("get_fs_brandon")
    # result_cate2[1][3] = 12

    # print("get_hardware_brandon")
    # result_cate2[1][4] = 24

    # print("get_ebpfnl_rules")
    result_cate1[0][0] = sum(1 for s in formatted_file_list if s.startswith("kprobe")) + sum(1 for s in formatted_file_list if s.startswith("kretprobe"))
    result_cate1[0][1] = sum(1 for s in formatted_file_list if s.startswith("uprobe")) + sum(1 for s in formatted_file_list if s.startswith("uretprobe"))
    result_cate1[0][2] = sum(1 for s in formatted_file_list if s.startswith("tracepoint"))
    result_cate2[0][0] =6
    result_cate2[0][1] = sum(1 for s in formatted_file_list if s.__contains__("syscall")) 
    result_cate2[0][2] =sum(1 for s in formatted_file_list if s.__contains__("tcp")) +sum(1 for s in formatted_file_list if s.__contains__("net"))
    result_cate2[0][3] =sum(1 for s in formatted_file_list if s.__contains__("fs")) 
    result_cate2[0][4] =4

    # for j in range(3):
    #     result_cate1[3][j] = result_cate1[0][j] + result_cate1[0][j] + result_cate1[1][j]
    # for j in range(5):
    #     result_cate2[3][j] = result_cate2[0][j] + result_cate2[0][j] + result_cate2[1][j]
    

    # print("plot_graph")
    # plot_TS_expect(make_percentage(result_cate1),make_percentage(result_cate2),cate1,cate2)
    print(result_cate1,result_cate2)