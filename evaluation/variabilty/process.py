import json
import os
import pandas as pd
import numpy as np
from matplotlib import pyplot as plt

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

def aggregate_results(file_names):
        
    # Initialize a dictionary to store return values
    return_values = {}

    for json_file in file_names:
        with open(os.path.join(json_dir, json_file)) as f:
                # Load the JSON data
                data = f.readlines()
                # Loop over each line in the data
                for i, line in enumerate(data):
                    test_case = i
                    # If this test case is not in the dictionary, add it
                    if test_case not in return_values:
                        return_values[test_case] = []
                    try:
                        json_res = json.loads(line)
                        # Extract the test case and return value
                        return_value = json_res["returncode"]

                        # Append the return value to the list for this test case
                        return_values[test_case].append(return_value)
                    except Exception as e:
                        print(f"Error processing {e} in {json_file}:{line}")
                        return_values[test_case].append(1)
    return return_values

return_values = aggregate_results(vector_db_with_example_files)
df = pd.DataFrame(return_values)
df.to_csv('vector_db_with_example_files.csv')


return_values = aggregate_results(vec_db_with_examples_3trails_and_smt_files)
df = pd.DataFrame(return_values)
df.to_csv('vec_db_with_examples_3trails_and_smt_files.csv')

# Load the data from the CSV file
df = pd.read_csv('vector_db_with_example_files.csv')

# Convert the DataFrame to a numpy array
result = df.to_numpy()

def plot_TS_expect(result, *name):
    for i in range(len(name)):
        plt.figure(figsize=(16, 9))
        # plt.ylim([0, 20000])
        df = pd.DataFrame(result[i])
        plt.plot(df, title="The graph for scaled "+name[i])
        plt.savefig(name[i]+".png")

# Call the plotting function
plot_TS_expect(result, "SPP Comparison")
