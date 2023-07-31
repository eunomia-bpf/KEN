import json
import os
from langchain.chains.conversation.memory import ConversationBufferMemory
from langchain.chat_models import ChatOpenAI
from langchain.chains import ConversationChain


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
                print(
                    f"The article named <{file_name}> has failed... \n\n")


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
    generate_bpftrace_once()
