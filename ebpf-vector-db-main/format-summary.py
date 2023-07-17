import json

def rearrange_summary(input_file, output_file):
    """
    Rearranges the article content and saves it to a new JSON file.

    Args:
        input_file (str): The path to the input JSON file.
        output_file (str): The path to the output JSON file.
    """
    # Load data from the input file
    with open(input_file, 'r', encoding='utf-8') as file:
        summary = json.load(file)

    rearranged_data = {"data": []}

    # Rearrange the data structure
    for _, contents in summary.items():
        for content in contents:
            question, answer = list(content.keys())[0], list(content.values())[0]
            section = question + " " + answer
            piece = {"content": section}
            rearranged_data["data"].append(piece)

    # Save the rearranged data to the output file
    with open(output_file, 'w', encoding='utf-8') as file:
        json.dump(rearranged_data, file)

# Define the paths for the input and output files
input_json_file = "./data/summary.json"
output_json_file = "./data/format-summary.json"

# Execute the function to rearrange the article content
rearrange_summary(input_json_file, output_json_file)
