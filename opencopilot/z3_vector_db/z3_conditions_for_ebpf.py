import json
import os
import re
import time
from langchain.chains.conversation.memory import ConversationBufferMemory
from langchain.chat_models import ChatOpenAI
from langchain.chains import ConversationChain

def libbpf_prompt(statement, doc):
    prompt = """
    I'm working on a project involving eBPF (Extended Berkeley Packet Filter) programs and I need to generate Z3 conditions for various eBPF helpers. These conditions will be used to prove the correctness of the eBPF programs. 
    The output should be in JSON format. For example:
    ```json
    {
        "bpf_map_update_elem": {
            "description": "Add or update the value of the entry associated to *key* in *map* with *value*.",
            "pre": {
                "map": "!=null",
                "key": "!=null",
                "value": "!=null",
                "flags": "in [BPF_NOEXIST, BPF_EXIST, BPF_ANY]",
                "map_type": "not in [BPF_MAP_TYPE_ARRAY, BPF_MAP_TYPE_PERCPU_ARRAY] when flags == BPF_NOEXIST"
            },
            "post": {
                "return": "in [0, negative number]"
            }
        }
    }
    ```
    """
    info = f"""
    Could you assist me generate these conditions for function `{statement}` in JSON format? The helper doc is:
    ```txt
    {doc}
    ```
    """
    return prompt + info

def generate_response(PROMPT):
    """
    Generates a response using the OpenAI GPT-3.5 language model.

    Parameters:
        PROMPT (str): The input prompt for the language model.

    Returns:
        str: The generated response from the language model.
    """

    llm = ChatOpenAI(model_name="gpt-3.5-turbo-16k", temperature=0)
    agent_chain = ConversationChain(llm=llm, verbose=False, memory=ConversationBufferMemory())
    response = agent_chain.predict(input=PROMPT)
    return response

def generate_libbpf_once():
    """
    Process libbpf help information and generate JSON format Z3 verification conditions.

    Returns:
        None
    """
    responses = []
    with open("opencopilot/z3_vector_db/data/bpf_helper_defs_format.json", 'r', encoding='utf-8') as file:
        data = json.load(file)
        for key, value in data.items():

            prompt = libbpf_prompt(key, value)
            response = generate_response(prompt)

            code_pattern = r'```json\n(.*?)\n```'
            json_code = re.findall(code_pattern, response, re.DOTALL)
            if not json_code:
                json_code = response

            responses += json_code
            print(json_code, '\n\n')

            with open("opencopilot/z3_vector_db/data/libbpf_z3.json", 'a+', encoding='utf-8') as file:
                file.write(json_code[0] + ",\n")

def generate_bpftrace_once():
    """
    Generates summaries for articles and saves them in a JSON file.

    Returns:
        None
    """

    folder_path = "./posts"
    files = os.listdir(folder_path)
    articles = {}
    for file_name in files:
        json_file = "../ebpf-vector-db-main/bpftrace/output.json"
        file_path = os.path.join(folder_path, file_name)
        file_name = file_name[:-4]
        if file_name in articles:
            print(
                f"The article named {file_name} already exists. Skipping...")
            continue
        if os.path.isfile(file_path):
            try:
                with open(file_path, 'r', encoding='utf-8') as file:
                    content = file.read()
                    result = get_onefunction(content)
                    articles[file_name] = result
                    print(
                        f"The article named <{file_name}> is finished. \n\n")
                    with open(json_file, 'w', encoding='utf-8') as file:
                        json.dump(articles, file)
            except Exception as _:
                print(f"The article named <{file_name}> has failed... \n\n")


def get_onefunction(content):
    """
    Generates a summary for an article.

    Args:
        content (str): The content of the article.

    Returns:
        str: The generated summary.
    """

    PROMPT = f"""
    You Are required to finish the following job, I will provide the following code:
    ```text
    {content}
    ```
    """ + \
    """
    I will need for the line generate a 
    PLEASE PROVIDE THE CONTENT IN THE FOLLOWING FORMAT:
    ```json
    [{"function1": {"pre":{"var1":"condition1","var2":"condition2"},"post":{"var1":"condition3","var4":"condition4"}}]
    ```
    Here is an example:
    ```json
    {"bpf_jit_charge_modmem":{"pre":{"X":"<100"},"post":{"Z":">1"}}}
    ```
    """

    llm = ChatOpenAI(model_name="gpt-3.5-turbo-16k", temperature=0)
    agent_chain = ConversationChain(llm=llm, verbose=False, memory=ConversationBufferMemory())
    response = agent_chain.predict(input=PROMPT)
    return response


if __name__ == "__main__":

    generate_libbpf_once()
