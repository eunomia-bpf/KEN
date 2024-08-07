# Kgent: Kernel Extensions Large Language Model Agent

This repository contains the code and evaluation for the paper [Kgent: Kernel Extensions Large Language Model Agent](https://dl.acm.org/doi/10.1145/3672197.3673434).

## Key Idea

Kgent leverages recent advances in large language models (LLMs) to simplify the creation of eBPF (extended Berkeley Packet Filters) programs, which are traditionally challenging due to the required deep knowledge of operating system internals and programming constraints enforced by the eBPF verifier.

### Highlights

- **Natural Language to eBPF**: Translates user prompts in natural language to eBPF programs.
- **Combination of Techniques**: Employs program comprehension, symbolic execution, and feedback loops to ensure the synthesized program is semantically equivalent to the user's prompt.
- **Evaluation**: Demonstrates a 2.67x improvement over GPT-4 in producing correct eBPF programs, with a high accuracy rate and minimal false positives.

## Potential Use Cases

Kgent can be utilized in various scenarios to facilitate kernel development and management:

1. **System Administrators**: Simplifies the process for junior sys admins to create and maintain eBPF programs, reducing the need for in-depth OS kernel knowledge.
2. **DevOps Personnel**: Assists in writing and deploying kernel extensions for monitoring and tracing applications, leading to improved system performance and security.
3. **Patch Makers**: Enables easier creation of patches by translating natural language descriptions of issues and required fixes into eBPF programs.
4. **Kernel Developers**: Acts as a tool to quickly prototype and validate kernel extensions, saving time and reducing errors in the development process.
5. **Educational Purposes**: Provides a learning aid for students and new developers to understand eBPF programming through natural language interactions.
6. **Research and Experimentation**: Offers a platform for researchers to explore new eBPF applications and test hypotheses without deep diving into complex coding.
7. **Network Tools Development**: Facilitates the creation of custom network monitoring, security, and performance analysis tools by translating high-level requirements into efficient eBPF programs.

By lowering the barrier to entry for writing eBPF programs, Kgent opens up kernel extension development to a broader audience, promoting innovation and enhancing system capabilities.

## Links

eBPF'24 paper: [Kgent: Kernel Extensions Large Language Model Agent](https://dl.acm.org/doi/10.1145/3672197.3673434)

For additional details, refer to the earlier Arxiv version: [KEN: Kernel Extensions using Natural Language](https://arxiv.org/abs/2312.05531).

For a more usable tool, please check [GPTtrace](https://github.com/eunomia-bpf/GPTtrace). GPTtrace is without the verify part of the Kgent, but it is more user-friendly.

For the GPTtrace simplify web demo, see GPTtrace [web demo](https://github.com/eunomia-bpf/GPTtrace-web).

## Contents

- [dataset](dataset): the dataset used in kgent.
  - [dataset/libbpf/output.json](dataset/libbpf/output.json): the libbpf examples database with description.
  - [dataset/bpftrace/output.json](dataset/bpftrace/output.json): the bpftrace examples database with description.
  - [dataset/spec/helper_spec.json](dataset/spec/helper_spec.json): the z3 spec for the helper function.
  - [dataset/spec/kprobe_spec.json](dataset/spec/kprobe_spec.json): the z3 spec for the kprobe function.
- [evaluation](evaluation): the evaluation code.

## cite our work

```
@inproceedings{10.1145/3672197.3673434,
author = {Zheng, Yusheng and Yang, Yiwei and Chen, Maolin and Quinn, Andrew},
title = {Kgent: Kernel Extensions Large Language Model Agent},
year = {2024},
isbn = {9798400707124},
publisher = {Association for Computing Machinery},
address = {New York, NY, USA},
url = {https://doi.org/10.1145/3672197.3673434},
doi = {10.1145/3672197.3673434},
abstract = {The extended Berkeley Packet Filters (eBPF) ecosystem allows for the extension of Linux and Windows kernels, but writing eBPF programs is challenging due to the required knowledge of OS internals and programming limitations enforced by the eBPF verifier. These limitations ensure that only expert kernel developers can extend their kernels, making it difficult for junior sys admins, patch makers, and DevOps personnel to maintain extensions. This paper presents Kgent, an alternative framework that alleviates the difficulty of writing an eBPF program by allowing Kernel Extensions to be written in Natural language. Kgent uses recent advances in large language models (LLMs) to synthesize an eBPF program given a user's English language prompt. To ensure that LLM's output is semantically equivalent to the user's prompt, Kgent employs a combination of LLM-empowered program comprehension, symbolic execution, and a series of feedback loops. Kgent's key novelty is the combination of these techniques. In particular, the system uses symbolic execution in a novel structure that allows it to combine the results of program synthesis and program comprehension and build on the recent success that LLMs have shown for each of these tasks individually.To evaluate Kgent, we develop a new corpus of natural language prompts for eBPF programs. We show that Kgent produces correct eBPF programs on 80\%---which is an improvement of a factor of 2.67 compared to GPT-4 program synthesis baseline. Moreover, we find that Kgent very rarely synthesizes "false positive" eBPF programs--- i.e., eBPF programs that Kgent verifies as correct but manual inspection reveals to be semantically incorrect for the input prompt. The code for Kgent is publicly accessible at https://github.com/eunomia-bpf/KEN.},
booktitle = {Proceedings of the ACM SIGCOMM 2024 Workshop on EBPF and Kernel Extensions},
pages = {30–36},
numpages = {7},
keywords = {Large Language Model, Symbolic Execution, eBPF},
location = {Sydney, NSW, Australia},
series = {eBPF '24}
}
```

## LICENSE

MIT
