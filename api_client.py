# api_client.py

import http.client
import json
from config import API_HOST, API_AUTH

class APIClient: # Define the API client class
    def __init__(self, headers=None): # Define the constructor method
        self.conn = http.client.HTTPSConnection(API_HOST)
        self.headers = headers or {
            'Accept': 'application/json',
            'Authorization': API_AUTH,
            'Content-Type': 'application/json'
        }

    def send_messages(self, model, messages, temperature=0.01): # Define the send_messages method
        payload = json.dumps({
            "model": model,
            "temperature": temperature,
            "messages": messages
        })
        self.conn.request("POST", "/v1/chat/completions", payload, self.headers)
        res = self.conn.getresponse()
        data = json.loads(res.read().decode("utf-8"))
        response = data['choices'][0]['message']['content']
        return response
