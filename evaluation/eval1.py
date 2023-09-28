import os
import subprocess
import chain
import json
from typing import Callable
from datetime import datetime

def print_time():
    now = datetime.now()

    # Format and print the date and time
    formatted_date = now.strftime('%Y-%m-%d')  # Date in YYYY-MM-DD format
    formatted_time = now.strftime('%H:%M:%S')  # Time in HH:MM:SS format

    print("Date:", formatted_date)
    print("Time:", formatted_time)

def test_with_test_cases_and_feedback(
    func: Callable[[str, str], str], save_file: str, starts_from: int = 0
):
    with open("test_cases.txt", "r") as file:
        lines = file.readlines()

    with open("test_cases_human_info.txt", "r") as file:
        human_info_lines = file.readlines()

    passed_test_count = 0
    total_test_count = len(lines)
    if total_test_count != len(human_info_lines):
        raise Exception("Number of test cases and human info lines don't match.")

    for i, line in enumerate(lines):
        if i < starts_from:
            continue
        try:
            line = line.strip()  # Remove the newline character at the end

            print_time()
            print(f"\n\nRunning test case {i}: {line}")
            print(f"Output will be saved to: {save_file}")

            # Run the bpftrace.py script with the test case as input
            res = func(line, human_info_lines[i])
            data = json.loads(res)
            print(data)
            if data["returncode"] == 0:
                passed_test_count += 1
            # save the output to a file
            with open(save_file, "a") as f:
                f.write(res + "\n")
            print(f"Test case completed. Output saved to: {save_file}\n")
            print(
                f"Passed {passed_test_count} out of {total_test_count} test cases so far.\n"
            )
        except Exception as e:
            with open(save_file, "a") as f:
                f.write(json.dumps({"error": str(e)}))

def test_with_test_cases(
    func: Callable[[str], str], save_file: str, starts_from: int = 0
):
    with open("test_cases.txt", "r") as file:
        lines = file.readlines()

    passed_test_count = 0
    total_test_count = len(lines)

    for i, line in enumerate(lines):
        if i < starts_from:
            continue
        try:
            line = line.strip()  # Remove the newline character at the end

            print_time()
            print(f"\n\nRunning test case {i}: {line}\n\n")
            print(f"Output will be saved to: {save_file}")

            # Run the bpftrace.py script with the test case as input
            res = func(line)
            data = json.loads(res)
            print(data)
            if data["returncode"] == 0:
                passed_test_count += 1
            # save the output to a file
            with open(save_file, "a") as f:
                f.write(res + "\n")
            print(f"Test case completed. Output saved to: {save_file}\n")
            print(
                f"Passed {passed_test_count} out of {total_test_count} test cases so far.\n"
            )
        except Exception as e:
            with open(save_file, "a") as f:
                f.write(json.dumps({"error": str(e)}))

def test_zero_shot():
    save_file = f"zero_shot.json"
    test_with_test_cases(chain.run_zero_shot_bpftrace, save_file)


def test_few_shot():
    save_file = f"few_shot.json"
    test_with_test_cases(chain.run_few_shot_bpftrace, save_file)

def test_vector_db_with_examples():
    save_file = f"vector_db_with_example.json"
    test_with_test_cases(chain.run_few_shot_with_vector_db_bpftrace, save_file)

def test_few_shot_3trails():
    save_file = f"few_shot_3trails.json"
    test_with_test_cases(chain.run_few_shot_3trails, save_file)

def test_vector_db_with_examples_3trails():
    save_file = f"vec_db_with_examples_3trails.json"
    test_with_test_cases(chain.run_vector_db_with_examples_3trails, save_file)

def test_vector_db_with_examples_3trails_libbpf():
    save_file = f"vec_db_with_examples_3trails_libbpf.json"
    test_with_test_cases(chain.run_vector_db_with_examples_libbpf_3trails, save_file)

def test_few_shot_3trails_with_feedback():
    save_file = f"few_shot_3trails_with_feedback.json"
    test_with_test_cases_and_feedback(
        chain.run_few_shot_3trails_human_feedback, save_file
    )

def test_vector_db_with_examples_3trails_with_feedback():
    save_file = f"vec_db_with_examples_3trails_with_feedback.json"
    test_with_test_cases_and_feedback(
        chain.run_vector_db_with_examples_3trails_human_feedback, save_file
    )

def test_few_shot_with_vector_db_and_smt_bpftrace_3trails():
    save_file = f"vec_db_with_examples_3trails_and_smt.json"
    test_with_test_cases_and_feedback(chain.run_few_shot_with_vector_db_and_smt_bpftrace_3trails, save_file)

def test_few_shot_and_smt_bpftrace_3trails():
    save_file = f"few_shot_3trails_and_smt.json"
    test_with_test_cases_and_feedback(chain.run_few_shot_smt_bpftrace_3trails, save_file)

def test_few_shot_vec_db_and_smt_bpftrace_3trails():
    save_file = f"vec_db_3trails_and_smt.json"
    test_with_test_cases(chain.run_few_shot_with_vector_db_and_smt_bpftrace_3trails, save_file)

if __name__ == "__main__":
    test_vector_db_with_examples()
