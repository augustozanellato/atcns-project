#!/bin/bash

set -euo pipefail

if [ "$#" -ne 2 ]; then
    echo "Error: Two arguments are required"
    echo "Usage: $0 inputfile outputfile"
    exit 1
fi
inputfile="$1"
outputfile="$2"

nuclei -oJ "$outputfile" \
    -jsonl -l "$inputfile" \
    -severity low,medium,high,critical \
    -dast -headless -code -file -esc \
    -rate-limit 60 \
    -bulk-size 10 \
    -retries 2

nuclei -pdu "$outputfile"