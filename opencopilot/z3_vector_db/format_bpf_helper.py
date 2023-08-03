import re
import json

def extract_content_to_json(input_filename, output_filename):
    """
    Extracts content blocks from the input file and saves them as a JSON file.

    Parameters:
        input_filename (str): The name of the input file to process.
        output_filename (str): The name of the output JSON file.

    Returns:
        None
    """

    with open(input_filename, mode="r", encoding='utf-8') as file:
        input_content = file.read()
        pattern = r'/\*[\s\S]*?\*/\n.*?=\s.*?;'
        matches = re.findall(pattern, input_content)
        result = {}
        for match in matches:
            lines = match.split('\n')
            key = lines[-1]
            value = '\n'.join(lines[:-1])
            result[key] = value

        json_output = json.dumps(result)
        with open(output_filename, mode='w', encoding='utf-8') as js:
            js.write(json_output)



if __name__ == "__main__":
    input_filename = "opencopilot/z3_vector_db/data/bpf_helper_defs.h"
    output_filename = "opencopilot/z3_vector_db/data/bpf_helper_defs_format.json"
    extract_content_to_json(input_filename, output_filename)
