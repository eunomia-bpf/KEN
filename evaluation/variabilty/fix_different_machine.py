# step 1: generate rerun data
import json
import os
import pandas as pd
import numpy as np
from typing import List, TypedDict
import subprocess

# Directory where your JSON files are located
json_dir = "./"

# List of JSON files
vec_db_with_examples_3trails_and_smt_files = [
    f
    for f in os.listdir(json_dir)
    if f.endswith(".json") and f.startswith("vec_db_with_examples_3trails_and_smt")
]

vector_db_with_example_files = [
    f
    for f in os.listdir(json_dir)
    if f.endswith(".json") and f.startswith("vector_db_with_example")
]



class CommandResult(TypedDict):
    command: str
    stdout: str
    stderr: str
    returncode: int


def run_command(command: List[str], require_check: bool = False) -> CommandResult:
    """
    This function runs a command with a timeout.
    """
    print("The bpf program to run is: " + " ".join(command))
    if require_check:
        user_input = input("Enter 'y' to proceed, and hit Ctrl C to stop: ")
        if user_input.lower() != "y":
            print("Aborting...")
            return {
                "command": " ".join(command),
                "stdout": "",
                "stderr": "User not permit execute the program",
                "returncode": -1,
            }
    # Start the process
    with subprocess.Popen(
        command,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        text=True,
    ) as process:
        stdout = ""
        stderr = ""
        try:
            # Set a timer to kill the process if it doesn't finish within the timeout
            while process.poll() is None:
                # Only try to read output if the process is still running
                if process.stdout.readable():
                    line = process.stdout.read()
                    print(line, end="")
                    stdout += line
            # Wait for the process to finish and get the output
            last_stdout, last_stderr = process.communicate()
            stdout += last_stdout
            stderr += last_stderr
        except Exception as e:
            print("Exception: " + str(e))
        finally:
            print("kill process " + str(process.pid))
            # Make sure the timer is canceled
            if process.poll() is None and process.stdout.readable():
                stdout += process.stdout.read()
                print(stdout)
            if process.poll() is None and process.stderr.readable():
                stderr += process.stderr.read()
                print(stderr)
            max_length = 1024 * 1024
            return {
                "command": " ".join(command),
                "stdout": stdout[:max_length]
                + ("...[CUT OFF]" if len(stdout) > max_length else ""),
                "stderr": stderr,
                "returncode": process.returncode,
            }

def bpftrace_run_program(program: str) -> str:
    res = run_command(
        [
            "sudo",
            "timeout",
            "--preserve-status",
            "-s",
            "2",
            "20",
            "bpftrace",
            "-e",
            program,
        ]
    )
    return json.dumps(res)

def run_again_on_different_machine(file_names):
    for json_file in file_names:
        with open(os.path.join(json_dir, json_file)) as f:
                new_content = ""
                # Load the JSON data
                data = f.readlines()
                # Loop over each line in the data
                for i, line in enumerate(data):
                    try:
                        json_res = json.loads(line)
                        # Extract the test case and return value
                        return_value = json_res["returncode"]

                        if return_value == 255:
                            new_res = bpftrace_run_program(json_res["command"].replace("sudo timeout --preserve-status -s 2 20 bpftrace -e", "").strip("'"))
                            new_res = json.loads(new_res)
                            if new_res["returncode"] == 0:
                                line = line.replace("\"returncode\": 255", "\"returncode\": 0")
                                print("Rerun success for " + json_res["command"])
                            else:
                                print("Rerun failed for " + json.dumps(json_res))
                        new_content += line
                    except Exception as e:
                        print(f"Error processing {e} in {json_file}:{line}")
                        new_content += line
                with open(os.path.join(json_dir, json_file), "w") as f:
                    f.write(new_content)


run_again_on_different_machine(vector_db_with_example_files)
run_again_on_different_machine(vec_db_with_examples_3trails_and_smt_files)
