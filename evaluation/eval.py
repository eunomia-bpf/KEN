import os
import subprocess


def main():
    with open('cases.txt', 'r') as file:
        lines = file.readlines()

    for i, line in enumerate(lines):
        line = line.strip()  # Remove the newline character at the end
        save_file = f"data_save/output_{i}.txt"

        print(f"Running test case: {line}")
        print(f"Output will be saved to: {save_file}")

        # Run the bpftrace.py script with the test case as input
        process = subprocess.run(
            ["python3", "./bpftrace.py", line, "--save_file",
                save_file, "--model_name", "gpt-3.5-turbo-16k"],
        )

        print(f"Test case completed. Output saved to: {save_file}\n")


if __name__ == "__main__":
    main()
