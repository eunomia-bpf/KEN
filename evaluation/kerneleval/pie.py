import matplotlib.pyplot as plt
plt.rcParams.update({'font.size': 18})
# Sample Data
sizes1 = [19, 2, 17,2]
sizes2 = [9, 11, 4, 6,5,5]
cate1 = ["kprobe","uprobe","tracepoint","hardware"]
cate2 = ["application","syscall","network","fs","cpu","memory"]
colors=["#e7e1ef","#c994c7","#dd1c77","#fde0dd","gray","#FC8D59","#91BFDB"] # Example colors in Hex format
fig, axes = plt.subplots(1, 2, figsize=(20, 10))
axes[0].pie(sizes1, colors = colors, labels=cate1, autopct='%1.1f%%', startangle=90)
axes[0].axis('equal')  # Equal aspect ratio ensures that pie is drawn as a circle.
axes[1].pie(sizes2, colors = colors, labels=cate2, autopct='%1.1f%%', startangle=90)
axes[1].axis('equal')  # Equal aspect ratio ensures that pie is drawn as a circle.
plt.savefig("distribution.pdf")

