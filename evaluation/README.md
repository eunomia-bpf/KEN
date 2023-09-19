# evaluation for OpenCopilot

## baseline

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

## results

see records/README.md
