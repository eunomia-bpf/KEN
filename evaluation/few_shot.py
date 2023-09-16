import gpttrace
import json
from typing import Optional

from langchain.chains.openai_functions import (
    create_openai_fn_chain,
    create_structured_output_chain,
)
from langchain.chat_models import ChatOpenAI
from langchain.prompts import ChatPromptTemplate, HumanMessagePromptTemplate
from langchain.schema import HumanMessage, SystemMessage
from langchain.prompts.chat import (
    ChatPromptTemplate,
    HumanMessagePromptTemplate,
)
from langchain.prompts import PromptTemplate

message_prompt = HumanMessagePromptTemplate(
        prompt=PromptTemplate(
            template="{input}",
            input_variables=["input"],
        )
    )
prompt_template = ChatPromptTemplate.from_messages([message_prompt])

# If we pass in a model explicitly, we need to make sure it supports the OpenAI function-calling API.
llm = ChatOpenAI(model="gpt-4", temperature=0)

def run_bpftrace_prog_with_func_call_define(prog: str) -> str:
	"""Runs a bpftrace program. You should only input the eBPF program itself.

	Args:
		prog: The bpftrace program to run.
	"""
	return f"{prog}"

def run_bpftrace_prog_with_function_call(input: str) -> str:
	print("input prompt: ", input, "\n")
	chain = create_openai_fn_chain([run_bpftrace_prog_with_func_call_define], llm, prompt_template, verbose=False)
	res = chain.run(
		input
	)
	print(res)
	prog = res['prog']
	# read a.bt
	res = gpttrace.bpftrace_run_program(prog)
	print(res)
	return res

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

if __name__ == "__main__":
	run_few_shot_bpftrace("traces file read and write events and summarizes the Read bytes by process.")
