from cProfile import label
import numpy as np
from scipy import stats
from time import time
from matplotlib import style
import matplotlib.pyplot as plt
from statistics import mean
import plotly.express as px
from sympy import print_glsl
import pandas as pd
style.use('ggplot')

formated_file_list1 = ["tracepoint:irq:irq_handler_entry","tracepoint:sched:sched_process_fork","kprobe:__kmalloc","kprobe:do_prlimit","tracepoint:signal:signal_deliver","tracepoint:raw_syscalls:sys_exit","kprobe:tcp_v4_syn_recv_sock","tracepoint:raw_syscalls:sys_enter1","tracepoint:raw_syscalls:sys_enter2","tracepoint:syscalls:sys_enter_socket","tracepoint:syscalls:sys_enter_openat","tracepoint:syscalls:sys_enter_read","kprobe:net_namespace","tracepoint:syscalls:sys_enter_open","hardware:cache","tracepoint:exceptions:page_fault_user","uretprobe:/bin/bash:readline"]# doing
result1 = np.zeros((2, 5))
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

            cycle_flag = 0
            for line in f:
                try:
                    if (cycle_flag == 1):
                        cycle_flag = 0
                        result[0][file_idx] = (float(line[30:45].replace(
                            ":", "").replace("%", "").strip()))
                except Exception as err:
                    print(err)
                try:
                    if line.__contains__("L2(0)"):
                        result[1][file_idx] = (float(line[31:42].replace(
                            ":", "").replace("%", "").strip()))
                except Exception as err:
                    print(err)
                if line.__contains__("Cycles"):
                    cycle_flag = 1
        except Exception as err:
            print(err)
    return result


print(formated_file_list1)
result = get_data(result1, formated_file_list1)
print(result)
plot_TS_expect(result, "SPP Comparison")