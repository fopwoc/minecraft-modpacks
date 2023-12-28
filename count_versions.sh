#!/bin/bash
# takes version.csv and count lines
set -e

FILE="version.csv"

if [ ! -e "$FILE" ]; then
    echo "File $FILE does not exist"
    exit 1
fi

wc -l < "$FILE" | tr -d '[:space:]'
