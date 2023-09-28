import requests

API_URL = "https://vbvhusef1oe4a22d.us-east-1.aws.endpoints.huggingface.cloud"
headers = {
	"Authorization": "Bearer xxx",
	"Content-Type": "application/json"
}

def query(input: str):
	response = requests.post(API_URL, headers=headers, json={
	    "inputs": input,
    })
	output = response.json()
    return output[0]['generated_text']
