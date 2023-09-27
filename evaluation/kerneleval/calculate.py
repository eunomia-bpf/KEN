import os
import subprocess
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
def get_kprobe_pixel_kernel():
    os.chdir("pixel_kernel")
    res = subprocess.run(["git log|grep kprobe|wc -l"], stdout=subprocess.PIPE)
    return int(res.stdout.decode("utf-8").split(" ")[0])

def get_tracepoint_pixel_kernel():
    os.chdir("pixel_kernel")
    res = subprocess.run(["git log|grep tracepoint|wc -l"], stdout=subprocess.PIPE)
    return int(res.stdout.decode("utf-8").split(" ")[0])

def get_seccomp_pixel_ebpf_rules():
    pass

def get_cgroup_pixel_ebpf_rules():
    pass

# greggs brandon
def get_kprobe_brandon_dataset():
    pass

def get_tracepoint_brandon_dataset():
    pass

def get_seccomp_brandon_ebpf_rules():
    pass

def get_cgroup_brandon_ebpf_rules():
    pass

# ebpfnldataset
def get_kprobe_ebpfnl_dataset():
    pass

def get_tracepoint_ebpfnl_dataset():
    pass

def get_seccomp_ebpfnl_ebpf_rules():
    pass

def get_cgroup_ebpfnl_ebpf_rules():
    pass

if __name__ == "__main__":
    if not os.path.exists("pixel_kernel"):
        clone_pixel_kernel()

    calculate_pixel_ebpf_rules()