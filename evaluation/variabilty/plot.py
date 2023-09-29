import pandas as pd
import matplotlib.pyplot as plt

# Load the data from the CSV files
df1 = pd.read_csv('vector_db_with_example_files.csv')
df2 = pd.read_csv('vec_db_with_examples_3trails_and_smt_files.csv')

# Initialize a figure with 40 subplots arranged in a grid
fig, axes = plt.subplots(4, 10, figsize=(20, 20))

# Flatten the axes array to make indexing easier
axes = axes.flatten()

# For each test case
for i in range(40):
    # Calculate success, failure, and false positive percentages for the first CSV file
    success_percent1 = (df1[str(i)] == 0).mean() * 100
    failure_percent1 = (df1[str(i)] > 0).mean() * 100
    fp_percent1 = (df1[str(i)] == -2).mean() * 100
    error_percent1 = (df1[str(i)] == -1).mean() * 100
    if error_percent1 > 0:
        print(f'Test case {i+1} has {error_percent1}% errors in the first CSV file')
        success_percent1 = success_percent1 * 100 / (100 - error_percent1)
        failure_percent1 = failure_percent1 * 100 / (100 - error_percent1)
        fp_percent1 = fp_percent1 * 100 / (100 - error_percent1)
    # Calculate success, failure, and false positive percentages for the second CSV file
    success_percent2 = (df2[str(i)] == 0).mean() * 100
    failure_percent2 = (df2[str(i)] > 0).mean() * 100
    fp_percent2 = (df2[str(i)] == -2).mean() * 100
    error_percent2 = (df2[str(i)] == -1).mean() * 100
    if error_percent2 > 0:
        print(f'Test case {i+1} has {error_percent2}% errors in the second CSV file')
        success_percent2 = success_percent2 * 100 / (100 - error_percent2)
        failure_percent2 = failure_percent2 * 100 / (100 - error_percent2)
        fp_percent2 = fp_percent2 * 100 / (100 - error_percent2)

    # Plot a stacked bar chart in the corresponding subplot
    axes[i].bar(1, success_percent1, color='green')
    axes[i].bar(1, failure_percent1, bottom=success_percent1, color='red')
    axes[i].bar(1, fp_percent1, bottom=success_percent1 + failure_percent1, color='blue')

    axes[i].bar(2, success_percent2, color='green')
    axes[i].bar(2, failure_percent2, bottom=success_percent2, color='red')
    axes[i].bar(2, fp_percent2, bottom=success_percent2 + failure_percent2, color='blue')

    axes[i].set_title(f'Test case {i+1}')
    axes[i].set_xticks([1, 2])
    axes[i].set_xticklabels(['base', 'smt'])
    axes[i].set_ylim([0, 100])

# Automatically adjust subplot parameters to give specified padding
plt.tight_layout()

# Save the figure
plt.savefig("testcases.png")
