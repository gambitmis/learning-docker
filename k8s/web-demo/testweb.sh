#!/bin/bash

# Define the URL and the filter word
url="http://gdcc-webdemo.dg-paas.cloud"
filter_word="<th colspan=\"2\">"

# Set the loop count to 100
loop_count=50

# Loop 'loop_count' times
for ((i=1; i<=loop_count; i++)); do
    # Execute curl command and grep for the filter word
    result=$(curl -s -L "$url" | grep -E "$filter_word")
    sleep 1
    # Display the output if it matches the filter word
    if [[ -n "$result" ]]; then
        echo "Match found in iteration $i:"
        echo "$result"
    fi
done
