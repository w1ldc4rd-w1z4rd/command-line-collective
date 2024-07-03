#!/usr/bin/env python

import json
import requests
import sys

def api(payload, url):
    headers = {'Content-Type': 'application/json'}
    json_data = json.dumps(payload)

    response = requests.post(url, data=json_data, headers=headers, stream=True)
    if response.status_code == 200:
        buffer = ""
        try:
            for chunk in response.iter_content(chunk_size=1024):
                # Decode chunk to string
                chunk = chunk.decode('utf-8')
                buffer += chunk
                # Process complete JSON objects
                while '\n' in buffer:
                    line, buffer = buffer.split('\n', 1)  # Split on the first newline
                    if line.strip():
                        try:
                            json_obj = json.loads(line)
                            response_text = json_obj['response']
                            print(response_text, end='', flush=True)  # Print the response part
                        except json.JSONDecodeError:
                            continue  # Ignore JSON decode errors and continue
        except Exception as e:
            print(f"\033[1;31m> Error: {str(e)}\033[0m")
            raise
    else:
        print("\033[1;31m> request failed: {}\033[0m".format(response.status_code))
        raise Exception("Request failed")

if __name__ == "__main__":
    prompt = "Write me a fantasy story!"
    payload = {
        'model': 'mistral',
        'options': {'num_ctx': 16384},
        'prompt': prompt
    }
    api(payload, 'http://localhost:11434/api/generate')

