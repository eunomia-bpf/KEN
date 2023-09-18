import os
import subprocess
import chain
import json
from typing import Callable

def test_with_test_cases(func: Callable[[str], str], save_file: str):
    with open('test_cases.txt', 'r') as file:
        lines = file.readlines()

    passed_test_count = 0
    total_test_count = len(lines)

    for i, line in enumerate(lines):
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
        except e:
            with open(save_file, "a") as f:
                f.write(json.dumps({"error": str(e)}))

save_file = f"output.json"

def test_few_shot():
    test_with_test_cases(chain.run_few_shot_bpftrace, save_file)
    
def test_zero_shot():
    test_with_test_cases(chain.run_zero_shot_bpftrace, save_file)

def test_vector_db_with_examples():
    test_with_test_cases(chain.run_few_shot_with_vector_db_bpftrace, save_file)

def test_vector_db():
    test_with_test_cases(chain.run_vector_db_bpftrace, save_file)

def test_few_shot_3trails():
    test_with_test_cases(chain.run_few_shot_3trails, save_file)

def test_vector_db_with_examples_3trails():
    test_with_test_cases(chain.run_vector_db_with_examples_3trails, save_file)

if __name__ == "__main__":
    test_vector_db_with_examples_3trails()
