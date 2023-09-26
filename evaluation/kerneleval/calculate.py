import os
# https://source.android.com/docs/core/architecture/kernel/bpf
def clone_pixel_kernel():
    os.system("repo init -u https://android.googlesource.com/kernel/manifest -b android-gs-raviole-5.10-android13-qpr2")
    os.system("repo sync -j$(nproc --all)")

def calculate_pixel_ebpf_rules():
    pass

