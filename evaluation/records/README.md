# test record

- return 0: success
- return 1: failed to load
- return 255: timeout

## few shot with gpt 3.5 test with 40 prompts

date: 9.16

- "returncode": 0, count 14
- "returncode": 1, count 22
- "returncode": 255, count 4

## few shot with gpt 4 test with 40 prompts

date: 9.16

- "returncode": 0, count 13
- "returncode": 1, count 24
- "returncode": 255, count 3

## few shot and vector db with gpt 3.5 test with 40 prompts

date: 9.16

- "returncode": 0, count 22
- "returncode": 1, count 16
- "returncode": 255, count 2

seleted top 2 elements from vector db

## vector db with gpt 3.5 test with 40 prompts

