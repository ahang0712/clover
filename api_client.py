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

    def send_messages(self, model, messages, temperature=0.0): # Define the send_messages method
        # Create a payload with the model, temperature, and messages
        payload = json.dumps({
            "model": model,
            "temperature": temperature,
            "messages": messages
        })
        # Send a POST request to the API with the payload and headers
        self.conn.request("POST", "/v1/chat/completions", payload, self.headers)
        # Get the response from the API
        res = self.conn.getresponse()
        # Decode the response and load it as a JSON object
        data = json.loads(res.read().decode("utf-8"))
        # Get the response from the API
        response = data['choices'][0]['message']['content']
        # Return the response
        return response
