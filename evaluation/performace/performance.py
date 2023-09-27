import argparse
import GPUtil
import pynvml
import psutil
import time

def start_magic_trace():
    os.system("./magic")
    pass

def get_vram(desired_pid) -> int:
    # Fetching GPU details
    GPUs = GPUtil.getGPUs()
    for i, gpu in enumerate(GPUs):
        print(f"GPU {i} : {gpu.name}")

        # Fetching GPU processes using nvidia-smi
        gpu_processes = GPUtil.getGPUs()[i].processes
        
        # Check each process on the current GPU
        for p in gpu_processes:
            if p.pid == desired_pid:
                try:
                    proc = psutil.Process(p.pid)
                    print(f"Process ID: {p.pid}")
                    print(f"GPU Memory Used: {p.gpu_memory_usage}MB")
                    print(f"Process Name: {proc.name()}")
                    print(f"User: {proc.username()}")
                except psutil.NoSuchProcess as e:
                    print(f"Process with PID {p.pid} not found.")
            return p.gpu_memory_usage

def get_vram_nvml(desired_pid) -> int:

    # Get the handle for the first GPU device
    device_handle = pynvml.nvmlDeviceGetHandleByIndex(0)
    mem = 0
    try:
        # Get the list of compute running processes on the GPU
        processes = pynvml.nvmlDeviceGetComputeRunningProcesses(device_handle)
        
        for process in processes:
            if process.process_name.__contains__("python"):
                mem += process.usedGpuMemory
            print(f'PID: {process.pid}, Process Name: {process.process_name}, Used GPU Memory: {process.usedGpuMemory}')
        return mem
    except pynvml.NVMLError as error:
        print(f"Failed to retrieve processes: {error}")


def get_ps(desired_pid) ->(float, float):
    output= subprocess.run(["ps", "-p", desired_pid, "-o", "%cpu,%mem"]).stdout.decode("utf-8").split("\n")[1].split(" ")
    return float(output[0]), float(output[1])

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Get GPU memory usage for a given PID")
    parser.add_argument("--pid", type=int, required=False)
    args = parser.parse_args()
    if args.pid is None:
        pid=start_magic_trace()
    else:
        desired_pid = args.pid

    try:
        pynvml.nvmlInit()
        process = psutil.Process(desired_pid)
        with open(f"usage_{desired_pid}.csv", "w") as f:
            # Poll the process status in a loop
            while process.is_running():
                # get_vram(args.pid)
                vram = get_vram_nvml(desired_pid)
                
                time.sleep(1)  # sleep for 1 second
        
        print(f"Process {desired_pid} has finished.")

    except psutil.NoSuchProcess:
        print(f"No process with PID {desired_pid} is running.")
    except Exception as e:
        print(f"An error occurred: {e}")
    pynvml.nvmlShutdown()
    