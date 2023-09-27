# z3 example: how z3 fix the semantic error of eBPF program

## init human request

```txt
write a bpftrace program to trace tcp_connect events and displaying the source and destination IP addresses with their respective ports.
```

## Ground Truth: correct program

```bpftrace
#ifndef BPFTRACE_HAVE_BTF
#include <linux/socket.h>
#include <net/sock.h>
#else
#include <sys/socket.h>
#endif

kprobe:tcp_connect
{
  $sk = ((struct sock *) arg0);
  $inet_family = $sk->__sk_common.skc_family;

  if ($inet_family == AF_INET || $inet_family == AF_INET6) {
    if ($inet_family == AF_INET) {
      $daddr = ntop($sk->__sk_common.skc_daddr);
      $saddr = ntop($sk->__sk_common.skc_rcv_saddr);
    } else {
      $daddr = ntop($sk->__sk_common.skc_v6_daddr.in6_u.u6_addr8);
      $saddr = ntop($sk->__sk_common.skc_v6_rcv_saddr.in6_u.u6_addr8);
    }
    $lport = $sk->__sk_common.skc_num;
    $dport = $sk->__sk_common.skc_dport;

    // Destination port is big endian, it must be flipped
    $dport = bswap($dport);

    printf("TCP connect: %s:%d -> %s:%d\n", $saddr, $lport, $daddr, $dport);
  }
}
```

## An error program

However, GPT4 will generate incorrect program:

```bpftrace
#ifndef BPFTRACE_HAVE_BTF
#include <linux/socket.h>
#include <net/sock.h>
#else
#include <sys/socket.h>
#endif

kprobe:tcp_connect
{
    $sk = (struct sock *) arg0;
    
    $saddr = ntop(2, $sk->__sk_common.skc_rcv_saddr);
    $daddr = ntop(2, $sk->__sk_common.skc_daddr);
    $sport = ($sk->__sk_common.skc_num);
    $dport = ($sk->__sk_common.skc_dport);
    
    printf("TCP connect: %s:%d -> %s:%d\n", $saddr, $sport, $daddr, $dport);
}
```

It can pass the verifier to run in the kernel, but has errors:

```console
$ sudo bpftrace OpenCopilot/examples/tcpconnect-error.bt  
Attaching 1 probe...
TCP connect: 192.168.174.128:46648 -> 192.168.174.1:53790
TCP connect: 192.168.174.128:46664 -> 192.168.174.1:53790
```

And cannot handle ipv6.

The provided example demonstrates how a semantic error in an eBPF program can be fixed. Let's break down the differences between the incorrect program and the correct program:

1. **Address Family Check**:
   - The correct program checks the address family (`skc_family`) of the socket to determine if it's an IPv4 (`AF_INET`) or IPv6 (`AF_INET6`) connection. This step is crucial because the way IP addresses are stored and accessed differs between IPv4 and IPv6.
   - The incorrect program does not have this check, which means it will always try to access IPv4 addresses even if the connection is IPv6.
2. **IPv6 Address Access**:
   - In the correct program, if the connection is IPv6, it accesses the IPv6 source and destination addresses using `$sk->__sk_common.skc_v6_daddr.in6_u.u6_addr8` and `$sk->__sk_common.skc_v6_rcv_saddr.in6_u.u6_addr8`, respectively.
   - The incorrect program does not have logic to handle IPv6 addresses.
3. **Port Byte Order**:
   - The correct program acknowledges that the destination port (`skc_dport`) is in big-endian format and needs to be converted to little-endian using `bswap($dport)`.
   - The incorrect program does not account for this byte order difference, which would result in an incorrect port number being displayed.

## Additional Human info or GPT4 correction

To improve the correctness of the program, the human can provides the following additional information to improve the semantic correctness of the program:

- Tracing the tcp_connect function to capture both IPv4 and IPv6 TCP connection attempts, displaying the source and destination IP addresses with their respective ports, while ensuring the destination port's byte order is corrected (flipped).

We can also use GPT4 to generate the additional information. The example prompt can be:

- Prompt: Based on the provided human input {input}, generate a comprehensive description detailing the functionality and intricacies of the eBPF program. Highlight the key aspects and hook function or tracepoint of how the program operates.

## Use Additional info, z3 verifier, Kernel Logic DB to improve the semantic correctness of the program

Let's break it into a few steps. Before each step, we will using bpftrace to compile to and make sure the code can be compile. If not, retry generating it.

### Step 1: Get the function information of hook functions from Kernel Logic DB

Ask GPT$4 to search the Kernel Logic DB for the function information of hook functions. For example, the function information of `tcp_connect` is:

```json
        "kretprobe:tcp_connect_init": {
            "description": "Initialize TCP connection of ipv4 and ipv6",
            "pre": {
                "sk": "!=null",
                "dst": "!=null",
                "tp": "!=null",
                "rcv_wscale": "is_valid",
                "rcv_wnd": "is_valid"
            }
        },
```

### Step 2: Generate assumes for the verifier

Then, ask AI to generate the following assumes for the verifier:

```bpftrace
#ifndef BPFTRACE_HAVE_BTF
#include <linux/socket.h>
#include <net/sock.h>
#else
#include <sys/socket.h>
#endif

kprobe:tcp_connect
{
    $sk = (struct sock *) arg0;

    // Assumptions
    assume($sk != 0);
    assume($sk->__sk_common.skc_rcv_saddr != 0);
    assume($sk->__sk_common.skc_daddr != 0);
    assume($sk->__sk_common.skc_num >= 0);
    assume($sk->__sk_common.skc_dport >= 0);

    // Assumption for IPv4 and IPv6
    assume(sizeof($sk->__sk_common.skc_rcv_saddr) == 4 || sizeof($sk->__sk_common.skc_rcv_saddr) == 16);
    assume(sizeof($sk->__sk_common.skc_daddr) == 4 || sizeof($sk->__sk_common.skc_daddr) == 16);

    $saddr = ntop(2, $sk->__sk_common.skc_rcv_saddr);
    $daddr = ntop(2, $sk->__sk_common.skc_daddr);
    $sport = ($sk->__sk_common.skc_num);
    $dport = ($sk->__sk_common.skc_dport);

    // Assumption for byte order
    assume($dport == bswap($sk->__sk_common.skc_dport));

    printf("TCP connect: %s:%d -> %s:%d\n", $saddr, $sport, $daddr, $dport);
}
```

See assume.bt for generated results.

### Step 3: Run the verifier

First, dump the LLVM IR of the program:

```console
sudo opencopilot/z3_vector_db/bpftrace/bpftrace -d examples/assume.bt
```

Using z3 to verify it:

### Step 4: ask AI fix the semantic error of the program

We will prompt the AI to fix the semantic error of the program:

Template:

```txt
The bpftrace program below is use to {context}. The program:
{program}
has sat error. if the error is related to the program itself, please fix it.
```

Finally, you can rerun it to see the result:

```console
$ sudo bpftrace OpenCopilot/examples/tcpconnect-correct.bt 
Attaching 1 probe...
TCP connect: 192.168.174.128:48616 -> 192.168.174.1:7890
```
