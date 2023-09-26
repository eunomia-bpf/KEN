# run verifier

The verifier can be used to:

1. correct compile error or verification error of eBPF program
2. correct sematic error of eBPF program

## setup

1. set openai API key:

    ```sh
    export OPENAI_API_KEY=sk-*
    ```

2. use `git lfs pull` to pull the verifier and bpftrace deps

## Test the verifier for bpftrace

1. wrtie program in program.bt, see program.bt.example for example
2. write context(user request) in context.txt, see context.txt.example for example
3. run the verifier

```py
python verifier.py
```

## Test the verifier for libbpf

TODO
