import json

def restructure_json(input_file, output_file):
    with open(input_file, 'r') as f:
        data = json.load(f)

    # Restructure data
    restructured_data = {"data": []}
    for entry in data:
        content_str = "example: " + entry["request"] + "\n\n```\n" + entry["bpf"] + "\n```\n"
        restructured_data["data"].append({"content": content_str})

    # Save the restructured data to a new JSON file
    with open(output_file, 'w') as f:
        json.dump(restructured_data, f)

# Restructure the json data
restructure_json('output.json', 'examples.json')
