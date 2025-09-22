#!/bin/bash

set -euo pipefail

if [ "$#" -ne 2 ]; then
    echo "Error: Two arguments are required"
    echo "Usage: $0 inputfile outputfile"
    exit 1
fi
inputfile="$1"
outputfile="$2"

feroxbuster -w \
    httparchive_apiroutes.txt \
    -k -A --parallel 8 --stdin --json \ 
    -o "${outputfile}.json" -n \
    -s 200,400,401,403,405,406,412 < $inputfile

jq -r 'select(.type == "response") | .url' < "${outputfile}.json" > "${outputfile}.txt"