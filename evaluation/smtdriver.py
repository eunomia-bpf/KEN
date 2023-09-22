import os

def run_python_script_in_dir(script_path, dir_path):
    # Save the current working directory
    original_cwd = os.getcwd()

    try:
        # Change to the target directory
        os.chdir(dir_path)

        # Run the Python script
        os.system(f'python3 {script_path} ')

    finally:
        # Change back to the original directory
        os.chdir(original_cwd)

def run_verifier_for_better_bpftrace_proram(context_desc: str, program: str) -> str:
    print("\n\n[run_verifier_for_better_bpftrace_proram]: enter\n")
    with open('../opencopilot/context.txt', 'w') as f:
        f.write(context_desc)
    with open('../opencopilot/program.bt', 'w') as f:
        f.write(program)
    # Run the verifier for the better bpftrace program
    run_python_script_in_dir('verifier.py', '../opencopilot')
    
    res = ''
    with open('../opencopilot/result.bt', 'r') as f:
        res = f.read()
    # Return the path to the output file
    print("\n\n[run_verifier_for_better_bpftrace_proram]: exit\n")
    return res

if __name__ == "__main__":
    run_python_script_in_dir('verifier.py', '../opencopilot')