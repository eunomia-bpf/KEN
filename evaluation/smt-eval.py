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

# Usage
run_python_script_in_dir('verifier.py', '../opencopilot')