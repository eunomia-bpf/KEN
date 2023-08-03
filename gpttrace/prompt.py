import os
from gpttrace.examples import construct_bpftrace_examples


def construct_prompt_on_error(previous_prompt: str, text: str, output: str) -> str:
    """
    Construct prompts when an error occurs.

    :param text: User request.
    :return: Prompt.
    """
    examples = construct_bpftrace_examples(text)
    return f"""
    {previous_prompt}

    The previous command failed to execute or not finished.
    Maybe you can try list the attach points and choose one to attach, 
    if you have not done so before.
    The origin command and output is as follows:
    
    {output}
    """

def construct_prompt_for_explain(text: str, output: str) -> str:
    # fix the token limi
    if len(output) > 2048:
        output = output[:4096]
    return f"""
    please explain the output of the previous bpftrace result:
    
    {output}
    
    The original user request is: 
    
    {text}
    """

def construct_running_prompt(text: str) -> str:
    """
    Construct prompts that translate user requests into bpf commands.

    :param text: User request.
    :return: Prompt.
    """
    examples = construct_bpftrace_examples(text)
    return f"""
    As a supportive assistant to a Linux system administrator,
    your role involves leveraging bpftrace to generate eBPF code that aids
    in problem-solving, as well as responding to queries.
    Note that you may not always need to call the bpftrace tool function.
    Here are some pertinent examples that align with the user's requests:

    {examples}

    Now, you have received the following request from a user: {text}
    Please utilize your capabilities to the fullest extent to accomplish this task.
    """
