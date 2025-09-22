#!/bin/bash

if [ -z "$2" ]; then
    echo "Error: Missing arguments. Please provide both a scope file and output directory."
    echo "Usage: $0 <scope-file> <output-directory>"
    exit 1
fi

scope="$1"
output_dir="$2"

subfinder -dL $scope -oD $output_dir -oJ -cs -stats -v