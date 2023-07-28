"""
SEC("kretprobe/shrink_node")
int shrink_node_exit(struct pt_regs *ctx)
{
    u32 pid = bpf_get_current_pid_tgid();
    u64 *tsp, latency_us, latency_slot;

    tsp = bpf_map_lookup_elem(&start, &pid);
    if (!tsp) {
        return 0;
    }

    // Latency in microseconds
    latency_us = (bpf_ktime_get_ns() - *tsp) / 1000;

    // Latency histogram key
    latency_slot = log2l(latency_us);

    // Cap latency bucket at max value
    if (latency_slot > MAX_LATENCY_SLOT) {
        latency_slot = MAX_LATENCY_SLOT;
    }

    increment_map(&shrink_node_latency_seconds, &latency_slot, 1);

    latency_slot = MAX_LATENCY_SLOT + 1;
    increment_map(&shrink_node_latency_seconds, &latency_slot, latency_us);

    bpf_map_delete_elem(&start, &pid);

    return 0;
}
"""
from z3 import *

# Create an instance of the solver
s = Solver()

# Declare variables
pid = BitVec('pid', 32)
tsp = BitVec('tsp', 64)
start_map = Array('start_map', BitVecSort(32), BitVecSort(64))

# Assume that pid and tsp are non-negative
s.add(pid >= 0, tsp >= 0)

# Assume that the map contains an entry for pid
s.add(start_map[pid] == tsp)

# The code checks if the map contains an entry for pid
# If the entry doesn't exist, the function returns 0
# We can model this by adding a constraint that the entry must exist
s.add(start_map[pid] != 0)

# Now we can ask Z3 to find a model that satisfies the constraints
if s.check() == sat:
    print(s.model())
