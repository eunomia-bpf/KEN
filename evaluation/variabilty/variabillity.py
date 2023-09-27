import pandas as pd
import matplotlib.pyplot as plt

# Define the data
data = {
    'GPT4-Human3Trials': [
        {'Total Pass': 32, 'TP': 31, 'FP case': [29]},
        {'Total Pass': 33, 'TP': 33, 'FP case': []},
        {'Total Pass': 30, 'TP': 29, 'FP case': [40]}
    ],
    'GPT4-3Trails': [
        {'Total Pass': 25, 'TP': 24, 'FP case': [38]},
        {'Total Pass': 29, 'TP': 27, 'FP case': [14, 40]},
        {'Total Pass': 28, 'TP': 28, 'FP case': []},
        {'Total Pass': 30, 'TP': 29, 'FP case': [13]}
    ],
    'GPT4-Base': [
        {'Total Pass': 18, 'TP': 17, 'FP case': [40]},
        {'Total Pass': 18, 'TP': 18, 'FP case': [0]},
        {'Total Pass': 18, 'TP': 17, 'FP case': [10]}
    ]
}

# Convert the data into a DataFrame where each group is a column and each file is a row
df = pd.DataFrame({
    group: [file['TP'] for file in files]
    for group, files in data.items()
})

plt.figure(figsize=(10,6)) # You can adjust the figure size as needed
df.boxplot(grid=False, fontsize=15)

# Save the plot to a file
plt.savefig('boxplot.png')
