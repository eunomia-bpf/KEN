import json
import re
from typing import Callable, Optional
import time
import gpttrace
from langchain.chains import LLMChain
from langchain.chains.openai_functions import create_openai_fn_chain
from langchain.chat_models import ChatOpenAI
from langchain.llms import DeepInfra, HuggingFaceHub
from langchain.prompts import (
    ChatPromptTemplate,
    HumanMessagePromptTemplate,
    PromptTemplate,
)
from langchain.prompts.chat import ChatPromptTemplate, HumanMessagePromptTemplate
from langchain.schema import HumanMessage, SystemMessage

message_prompt = HumanMessagePromptTemplate(
    prompt=PromptTemplate(
        template="{input}",
        input_variables=["input"],
    )
)
prompt_template = ChatPromptTemplate.from_messages([message_prompt])

model = "gpt-4"  # can be "code-llama" or "gpt-3.5-turbo" or "gpt-3.5-turbo-16k"


def run_bpftrace_prog_with_func_call_define(prog: str) -> str:
    """Runs a bpftrace program. You should only input the eBPF program itself.

    Args:
                    prog: The bpftrace program to run.
    """
    return f"{prog}"


def run_gpt(input: str, model_name: str) -> str:
    # If we pass in a model explicitly, we need to make sure it supports the OpenAI function-calling API.
    llm = ChatOpenAI(model=model_name, temperature=0)
    chain = create_openai_fn_chain(
        [run_bpftrace_prog_with_func_call_define], llm, prompt_template, verbose=False
    )
    res = chain.run(input)
    print(res)
    prog = res["prog"]
    return prog


def extract_code_blocks(text: str) -> str:
    # Check if triple backticks exist in the text
    if "```" not in text:
        return text.replace("bpftrace -e", "").strip().strip("'")

    pattern = r"```(.*?)```"
    matches = re.findall(pattern, text, re.DOTALL)
    res = "\n".join(matches)
    return res.replace("bpftrace -e", "").strip().strip("'")


def run_code_llama(question: str) -> str:
    if len(question) >= 5 * 3000:
        print("question too long, truncating to 5 * 3000 chars")
        question = question[: 5 * 3000]
    llm = DeepInfra(model_id="codellama/CodeLlama-34b-Instruct-hf")
    llm.model_kwargs = {
        "temperature": 0.7,
        "repetition_penalty": 1.2,
        "max_new_tokens": 2048,
        "top_p": 0.9,
    }

    template = """<s>[INST] <<SYS>>
	You should only write the bpftrace program itself. 
	No explain and no instructions. No words other than bpftrace program.
	<</SYS>> {question} [/INST]
	"""

    prompt = PromptTemplate(template=template, input_variables=["question"])
    llm_chain = LLMChain(prompt=prompt, llm=llm)
    res = llm_chain.run(question)
    return extract_code_blocks(res)


def run_bpftrace_prog_with_function_call(input: str) -> str:
    print("input prompt: ", input, "\n")
    # read a.bt
    prog = ""
    # Sleep for 5 seconds
    time.sleep(2)
    if model == "gpt-4":
        prog = run_gpt(input, "gpt-4")
    elif model == "gpt-3.5-turbo":
        prog = run_gpt(input, "gpt-3.5-turbo")
    elif model == "code-llama":
        prog = run_code_llama(input)
    elif model == "gpt-3.5-turbo-16k":
        prog = run_gpt(input, "gpt-3.5-turbo-16k")
    else:
        print("invalid model name")
        exit(1)
    res = gpttrace.bpftrace_run_program(prog)
    print(res)
    data = json.loads(res)
    data["prompt"] = input
    return json.dumps(data)


def run_few_shot_bpftrace(user_request: str) -> str:
    examples = gpttrace.simple_examples
    prompt = f"""
Write a bpftrace program that traces or profile the following user request:

### User Request

{user_request}

### Examples

Here are some examples to help you get started with bpftrace:
{examples}
You can refer to the above examples to write your own bpftrace program. Use a tool 
provided to execute your bpftrace program.
You should only write the bpftrace program itself.
"""
    return run_bpftrace_prog_with_function_call(prompt)


def run_zero_shot_bpftrace(user_request: str) -> str:
    prompt = f"""
Write a bpftrace program that traces or profile the following user request:

### User Request

{user_request}

### Examples

Use a tool provided to execute your bpftrace program.
You should only write the bpftrace program itself.
"""
    return run_bpftrace_prog_with_function_call(prompt)


def run_few_shot_with_vector_db_bpftrace(user_request: str) -> str:
    examples = gpttrace.simple_examples
    complex_examples = gpttrace.get_top_n_example_from_vec_db(user_request, 2)
    prompt = f"""
Write a bpftrace program that traces or profile the following user request:

### User Request

{user_request}

### Examples

Here are some simple examples to help you get started with bpftrace:

{examples}

Here are some complex examples may be related to your user request:

{complex_examples}

You can refer to the above examples to write your own bpftrace program to help user with:

{user_request}

Use a tool provided to execute your bpftrace program.
You should only write the bpftrace program itself. 
"""
    return run_bpftrace_prog_with_function_call(prompt)


def run_vector_db_bpftrace(user_request: str) -> str:
    complex_examples = gpttrace.get_top_n_example_from_vec_db(user_request, 2)
    prompt = f"""
Write a bpftrace program that traces or profile the following user request:

### User Request

{user_request}

Here are some complex examples may be related to your user request:

{complex_examples}

You can refer to the above examples to write your own bpftrace program to help user with:

{user_request}

Use a tool provided to execute your bpftrace program.
You should only write the bpftrace program itself. 
"""
    return run_bpftrace_prog_with_function_call(prompt)


def run_3trails(prompt, func: Callable[[str], str]):
    count = 3
    res = func(prompt)
    while count > 0:
        data = json.loads(res)
        print(data)
        if data["returncode"] == 0:
            return res
        else:
            error = data["stderr"]
            print("retry left: ", count)
            print("error ", error)
            err_prompt = f"""
Run the bpftrace program：

{data["command"]}

with the following error and ouput:

{error}

This is your trail {3 - count + 1} out of 3 trails.
Please retry generating the bpftrace program for: {prompt}
"""
            old_prompt = data["prompt"]
            full_prompt = data["prompt"] + err_prompt
            print("full prompt: ", full_prompt)
            res = run_bpftrace_prog_with_function_call(full_prompt)
            count = count - 1
    return res


def run_3trails_with_human_feedback(
    prompt: str, hints: str, func: Callable[[str], str]
):
    count = 3
    res = func(prompt)
    while count > 0:
        data = json.loads(res)
        print(data)
        if data["returncode"] == 0:
            return res
        else:
            error = data["stderr"]
            print("retry left: ", count)
            print("error ", error)
            err_prompt = f"""
Run the bpftrace program：

{data["command"]}

with the following error and ouput:

{error}

This is your trail {3 - count + 1} out of 3 trails.
Please retry generating the bpftrace program for: {prompt}
Here is some hints for you to help you write the bpftrace program: 
{hints}
"""
            old_prompt = data["prompt"]
            full_prompt = data["prompt"] + err_prompt
            print("full prompt: ", full_prompt)
            res = run_bpftrace_prog_with_function_call(full_prompt)
            count = count - 1
    return res


def run_few_shot_3trails(user_request: str) -> str:
    return run_3trails(user_request, run_few_shot_bpftrace)


def run_few_shot_3trails_human_feedback(user_request: str, hints: str) -> str:
    return run_3trails_with_human_feedback(user_request, hints, run_few_shot_bpftrace)


def run_vector_db_with_examples_3trails(user_request: str) -> str:
    return run_3trails(user_request, run_few_shot_with_vector_db_bpftrace)


def run_vector_db_with_examples_3trails_human_feedback(
    user_request: str, hints: str
) -> str:
    return run_3trails_with_human_feedback(
        user_request, hints, run_few_shot_with_vector_db_bpftrace
    )


if __name__ == "__main__":
    run_few_shot_bpftrace("Trace bpf jit compile events.")
