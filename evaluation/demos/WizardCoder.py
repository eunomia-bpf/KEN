# Use a pipeline as a high-level helper
from transformers import pipeline

pipe = pipeline("text-generation",
                model="TheBloke/WizardCoder-Guanaco-15B-V1.0-GPTQ", 
                device_map="auto", 
                batch_size=1, 
                max_new_tokens=1024)

res = pipe("Generate a eBPF program Traces process signals and logs the signal names and process IDs affected.")
print(res)
print(res[0]['generated_text'])