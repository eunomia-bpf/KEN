import os
from flask import Flask, jsonify, request
from flask_cors import CORS
from gpttrace import simple_examples, get_top_n_example_from_vec_db
import os
from langchain.chat_models import ChatOpenAI
from langchain.llms import CTransformers


app = Flask(__name__)
CORS(app)

def prompt(user_query):
    complex_example = get_top_n_example_from_vec_db(user_query, 3)
    PROMPT = f"""
    Please create a BPFTrace program that accomplishes the following task: ${user_query}
    The program should be syntactically correct and ready for execution. 
    You can assume that the required BPFTrace probes and functions are available.
    Below are some simple examples of bpftrace usage:
    {simple_examples}
    Some more complex examples:
    {complex_example}
    GENERATE BPFTRACE EXECUTABLE CODE THAT SHOULD BE READY TO RUN WITHOUT ANY ADDITIONAL MODIFICATIONS!!!
    The code should be self-contained and able to run directly with BPFTrace. 
    The output should appear at the beginning of the response. 
    There's no need to include execution instructions or explanations. Just provide the BPFTrace code.
    Do not start with "\`\`\`bpftrace".
    """
    return PROMPT

def get_llm(model_name):
    print(model_name)
    if model_name == "codellama":
        llm = CTransformers(model='./models/codellama-7b-python.Q5_K_M.gguf',   
                model_type='llama',
                config={'max_new_tokens': 256,
                        'temperature': 0})
    if model_name == "gpt-3.5-turbo" or model_name == "gpt-4":
        llm = ChatOpenAI(temperature=0, model_name=model_name)
    return llm

def handler(user_query, bpf_type, model, api_key):
    if os.getenv('OPENAI_API_KEY', api_key) is None:
        print(
            "Either provide your access token through `-k` or through environment variable `OPENAI_API_KEY`")
        return
    llm = get_llm(model)
    result = llm.predict(prompt(user_query))
    return result

 
@app.route('/', methods=['POST'])
def post_json_data():
    # 从POST请求中获取JSON数据
    json_data = request.get_json()

    if json_data:
        # 提取所需的数据并创建响应
        user_query = json_data.get('user_query', '')
        bpf_type = json_data.get('bpfType', '')
        model = json_data.get('model', 'gpt-3.5-turbo')
        api_key = json_data.get('apiKey', '')
        result = handler(user_query, bpf_type, model, api_key)
        return result
    else:
        return jsonify({'error': '无效的JSON数据'}), 400

if __name__ == '__main__':
    app.run(debug=True, port=4000)
