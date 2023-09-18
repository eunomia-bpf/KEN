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

false positive: 37 40

## few shot with 3 trails for 4.0

date: 9.18

- "returncode": 0, count 20
- "returncode": 1, count 16
- "returncode": 255, count 3
- "error": 1

false positive: 37 40