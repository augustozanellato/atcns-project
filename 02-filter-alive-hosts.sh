#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Error: Two arguments are required"
    echo "Usage: $0 <input_directory> <output_file>"
    exit 1
fi

input_dir="$1"
output_file="$2"

jq -r '.host' "$input_dir"/*.json | httpx -oT "$output_file" -silent -threads 50 -retries 1 -timeout 5