#!/usr/bin/env ruby

require 'json'
require 'net/http'

def api(payload, url)
    cmd = ""
    
    uri = URI(url)
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Post.new(uri.path, 'Content-Type' => 'application/json')
    request.body = payload.to_json
    
    http.request(request) do |response|
        if response.code == '200'
            response.read_body do |chunk|
                response_json = JSON.parse(chunk)
                print "\e[1;32m#{response_json['response']}\e[0m"
                cmd += response_json['response']
            end
        else
            puts "\e[1;31m> request failed: #{response.code}\e[0m"
            raise "Request failed"
        end
    end
    
    return cmd
end

if __FILE__ == $PROGRAM_NAME
    prompt = "Write me a fantasy story!"
    
    payload = {
        'model' => 'mistral',
        'options' => { 'num_ctx' => 16384 },
        'prompt' => prompt
    }
    
    api(payload, 'http://localhost:11434/api/generate')
end
