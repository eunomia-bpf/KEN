import os
import subprocess
import few_shot
import json

def main():
    with open('test_cases.txt', 'r') as file:
        lines = file.readlines()

    save_file = f"output.json"
    passed_test_count = 0
    total_test_count = len(lines)

    for i, line in enumerate(lines):
        line = line.strip()  # Remove the newline character at the end

        print(f"Running test case: {line}")
        print(f"Output will be saved to: {save_file}")

        # Run the bpftrace.py script with the test case as input
        res = few_shot.run_few_shot_bpftrace(line)
        data = json.loads(res)
        print(data)
        if data["returncode"] == 0:
            passed_test_count += 1
        # save the output to a file
        with open(save_file, "a") as f:
            f.write(res)
        print(f"Test case completed. Output saved to: {save_file}\n")
        print(f"Passed {passed_test_count} out of {total_test_count} test cases so far.\n")

if __name__ == "__main__":
    main()
