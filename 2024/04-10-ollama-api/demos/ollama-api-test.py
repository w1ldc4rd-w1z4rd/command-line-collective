#!/usr/bin/env python

import json
import requests

def api(payload, url):
    cmd = ""
    
    headers = {'Content-Type': 'application/json'}
    
    # convert payload to JSON
    json_data = json.dumps(payload)
    
    # send POST request with stream=True to read the response as a stream
    response = requests.post(url, data=json_data, headers=headers, stream=True)
    
    # process response content as a stream
    if response.status_code == 200:
        for chunk in response.iter_content(chunk_size=1024):
            if chunk:
                response_json = json.loads(chunk)
                print("\033[1;32m" + response_json['response'] + "\033[0m", end='', flush=True)
                cmd += response_json['response']
        return cmd
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
