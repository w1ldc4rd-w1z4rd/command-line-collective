#!/bin/bash

# This script is not functioning as intended :(
 
# Required installations (Debian):
# 1. curl: Used for making HTTP requests. Install using `sudo apt-get install curl` on Ubuntu or `brew install curl` on macOS.
# 2. jq: Used for parsing JSON data. Install using `sudo apt-get install jq` on Ubuntu or `brew install jq` on macOS.

# Enable bold and colored output using ANSI escape sequences
GREEN="\033[1;32m"
BOLD="\033[1m"
RESET="\033[0m"
RED="\033[1;31m"

# API URL
URL="http://localhost:11434/api/generate"

# JSON payload
payload='{
  "model": "mistral",
  "options": { "num_ctx": 16384 },
  "prompt": "Write me a fantasy story!"
}'

# Function to send a POST request and handle streaming response
api() {
  local url=$1
  local payload=$2
  local buffer=""

  # Use curl to send the POST request with streaming enabled
  curl -N -s -X POST "$url" \
    -H "Content-Type: application/json" \
    -d "$payload" | jq --unbuffered -r '.response' 2>/dev/null | while IFS= read -r line; do
    # Append to buffer
    buffer+="$line"

    # Check for end of sentence or paragraph
    if [[ "$line" =~ [\.!?] ]] || [[ "$line" =~ $'\n' ]]; then
      # Print buffer and reset
      printf "${BOLD}${GREEN}%s${RESET}" "$buffer"
      buffer=""
      printf "\n"  # Ensure a newline is printed after each sentence/paragraph
    fi
  done

  # Print any remaining text in buffer
  if [[ -n "$buffer" ]]; then
    printf "${BOLD}${GREEN}%s${RESET}\n" "$buffer"
  fi
}

# Call the API function with the URL and payload
api "$URL" "$payload"

