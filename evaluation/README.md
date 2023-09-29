# evaluation for KEN

https://huggingface.co/codellama/CodeLlama-7b-Instruct-hf



## evaluation cases

use llm and vector data base examples to generate eBPF programs:

1. few shot with basic eBPF examples
2. few shot with vector database

use retry for hook points:

1. few shot with basic eBPF examples with 3 retries
2. few shot with vector database with 3 retries

## run evaluation

```sh
python3 eval.py
```

or test with output redirect:

```sh
time python3 eval.py > few_shot_3trails_and_smt-gpt4.txt 2>&1
```

## test cases

- test_cases.txt: test cases for evaluation, one case per line
- test_cases_human_info.txt: additional information for each test case, provided by human and can be used for retry

## results

see records/README.md

## monitor

run:

```py
if __name__ == "__main__":
    res = run_vector_db_with_examples_3trails(
        "Trace md flush events with pid and process name"
    )
    print(res)
```

will comsume:

```
real    22m0.315s
user    13m28.816s
sys     8m27.571s
```

