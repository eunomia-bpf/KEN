import re, os
import json


def get_function_list(program: str):
    matches = re.findall(r"EXPORT_SYMBOL_*\((\w+)\)", program)
    return matches


def extract_content_to_json(input_folder, output_filename):
    """
    Extracts content blocks from the input file and saves them as a JSON file.

    Parameters:
        input_folder (str): The Linux source code directory
        output_filename (str): The name of the output JSON file.

    Returns:
        None
    """
    count = 0
    result = {}
    for dirName, subdirList, fileList in os.walk(input_folder):
        print(f"Found file: {dirName}")
        for input_filename in fileList:
            print(count)
            print(f"\t{input_filename}")
            if input_filename.endswith(".c") or input_filename.endswith(".h"):
                with open(
                    dirName + "/" + input_filename, mode="r", encoding="utf-8"
                ) as file:
                    # prescan in the first place
                    input_content = file.read()
                    matched_func_list = get_function_list(input_content)
                    for func in matched_func_list:
                        pattern = re.compile(func + "(.*\n)*?EXPORT_SYMBOL.*\(" + func)
                        # print(pattern)
                        print(func)
                        # print(input_content)
                        matches = re.search(pattern, input_content)
                        if matches:
                            # print(matches.group())
                            lines = matches.group().split("*/")
                            # print("line", lines)
                            try:
                                value = (
                                    " ".join(lines[0].replace("/", "").split("*"))
                                    .replace("\n", "")
                                    .replace("\t", "")
                                )
                                # print("value",value, "line",lines[1])
                                # lines = lines[1].split("{")
                                key = (
                                    lines[1]
                                    .split("{")[0]
                                    .replace("\n", "")
                                    .replace("\t", "")
                                )
                                # print("key",key)
                                result[key] = value
                                # exit()
                                count += 1
                            except:
                                print("not function with comments")

    json_output = json.dumps(result)
    with open(output_filename, mode="w", encoding="utf-8") as js:
        js.write(json_output)


if __name__ == "__main__":
    input_folder = "opencopilot/z3_vector_db/data/linux"
    output_filename = "opencopilot/z3_vector_db/data/bpf_kprobe_def_format.json"
    extract_content_to_json(input_folder, output_filename)
