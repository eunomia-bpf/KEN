# test record

- return 0: success
- return 1: failed to load
- return 255: timeout

## few shot with gpt 3.5 test with 40 prompts

date: 9.16

- "returncode": 0, count 14
- "returncode": 1, count 22
- "returncode": 255, count 4

false positive: 6 11 30 38

## few shot with gpt 4 test with 40 prompts

date: 9.16

- "returncode": 0, count 13
- "returncode": 1, count 24
- "returncode": 255, count 3

false positive: 7

## few shot with code llama test with 40 prompts

date: 9.16

- "returncode": 0, count 8
- "returncode": 1, count 27
- "returncode": 255, count 3
- "returncode": -6, count 2

false positive: 10 18 26

## few shot and vector db with gpt 3.5 test with 40 prompts

date: 9.16

- "returncode": 0, count 22
- "returncode": 1, count 16
- "returncode": 255, count 2

seleted top 2 elements from vector db

false positive: 9 21 30 37 40

## few shot and vector db with gpt 4.0 test with 40 prompts

date: 9.16

- "returncode": 0, count 18
- "returncode": 1, count 19
- "returncode": 255, count 3

seleted top 2 elements from vector db

false positive: 37 40

## few shot and vector db with code llama test with 40 prompts

date: 9.16

- "returncode": 0, count 14
- "returncode": 1, count 23
- "returncode": 255, count 2
- "returncode": -6, count 1

seleted top 2 elements from vector db

false positive: 21 29 40

## vector db with gpt 3.5 test with 40 prompts

date: 9.16

- "returncode": 0, count 16
- "returncode": 1, count 20
- "returncode": 255, count 3
- "returncode": -6, count 1

{"command": "sudo timeout --preserve-status -s 2 20 bpftrace -e BEGIN { printf(\"Tracing network namespace creation and deletion... Hit Ctrl-C to end.\\n\"); } net:net_namespace_create { printf(\"Network namespace created: %s\\n\", str(arg1)); } net:net_namespace_destroy { printf(\"Network namespace deleted: %s\\n\", str(arg1)); }", "stdout": "", "stderr": "FATAL: Invalid probe type made it to attachpoint parser\ntimeout: the monitored command dumped core\n", "returncode": -6}
  
## vector db with gpt 4.0 test with 40 prompts

date: 9.16

- "returncode": 0, count 19
- "returncode": 1, count 21
- "returncode": 255, count 0
  
## few shot with 3 trails for 3.5

date: 9.18

- "returncode": 0, count 20
- "returncode": 1, count 16
- "returncode": 255, count 3
- "error": 1

false positive: 4 5 11 15 18 30 37

## few shot with 3 trails for 4.0

date: 9.18

- "returncode": 0, count 27
- "returncode": 1, count 9
- "returncode": 255, count 4

false positive: 13 19 33

## vec db with 3 trails for 3.5

date: 9.18

- "returncode": 0, count 27
- "returncode": 1, count 11
- "returncode": 255, count 2

false positive: 2 4 11 37

## vec db with 3 trails for 4.0

date: 9.18

- "returncode": 0, count 28
- "returncode": 1, count 10
- "returncode": 255, count 2

false positive: 37 40

## vec db with 3 trails for code llama

date: 9.18

- "returncode": 0, count 20
- "returncode": 1, count 15
- "returncode": 255, count 5

false positive: 26 29 40

## few shot with 3 trails and human feed back for 4.0

date: 9.18

- "returncode": 0, count 31
- "returncode": 1, count 6
- "returncode": 255, count 3

false positive: 13 34

## few shot with 3 trails for code llama

date: 9.18

- "returncode": 0, count 8
- "returncode": 1, count 27
- "returncode": 255, count 3

false positive: 10 18

## few shot with 3 trails and human feed back for code llama

date: 9.18

- "returncode": 0, count 17
- "returncode": 1, count 19
- "returncode": 255, count 0

false positive: 13 34

## vec db with 3 trails and human feed back for 4.0

date: 9.18

- "returncode": 0, count 30
- "returncode": 1, count 8
- "returncode": 255, count 2

false positive: 27

## vec db with 3 trails and human feed back for code llama

date: 9.18

- "returncode": 0, count 19
- "returncode": 1, count 15
- "returncode": 255, count 2

false positive: 20
