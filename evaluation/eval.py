import os
import subprocess
import chain
import json
from typing import Callable

# flags for continuing from a specific test case
starts_from = 0

def test_with_test_cases(func: Callable[[str], str], save_file: str):
    with open('test_cases.txt', 'r') as file:
        lines = file.readlines()

    passed_test_count = 0
    total_test_count = len(lines)

    for i, line in enumerate(lines):
        if i < starts_from:
            continue
        try:
            line = line.strip()  # Remove the newline character at the end

            print(f"Running test case {i}: {line}")
            print(f"Output will be saved to: {save_file}")

            # Run the bpftrace.py script with the test case as input
            res = func(line)
            data = json.loads(res)
            print(data)
            if data["returncode"] == 0:
                passed_test_count += 1
            # save the output to a file
            with open(save_file, "a") as f:
                f.write(res)
            print(f"Test case completed. Output saved to: {save_file}\n")
            print(f"Passed {passed_test_count} out of {total_test_count} test cases so far.\n")
        except Exception as e:
            with open(save_file, "a") as f:
                f.write(json.dumps({"error": str(e)}))

def test_few_shot():
    save_file = f"few_shot.json"
    test_with_test_cases(chain.run_few_shot_bpftrace, save_file)
    
def test_zero_shot():
    save_file = f"zero_shot.json"
    test_with_test_cases(chain.run_zero_shot_bpftrace, save_file)

def test_vector_db_with_examples():
    save_file = f"vector_db_with_example.json"
    test_with_test_cases(chain.run_few_shot_with_vector_db_bpftrace, save_file)

def test_vector_db():
    save_file = f"vector_db.json"
    test_with_test_cases(chain.run_vector_db_bpftrace, save_file)

def test_few_shot_3trails():
    save_file = f"few_shot_3trails.json"
    test_with_test_cases(chain.run_few_shot_3trails, save_file)

def test_vector_db_with_examples_3trails():
    save_file = f"vec_db_with_examples_3trails.json"
    test_with_test_cases(chain.run_vector_db_with_examples_3trails, save_file)

if __name__ == "__main__":
    test_vector_db_with_examples_3trails()
