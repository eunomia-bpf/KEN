# Use a pipeline as a high-level helper
from transformers import pipeline

pipe = pipeline("text-generation", model="TheBloke/WizardCoder-Guanaco-15B-V1.0-GPTQ", device_map="auto",batch_size=5)

for i in range(10):
    res = pipe("Traces process signals and logs the signal names and process IDs affected.")
    print(res)