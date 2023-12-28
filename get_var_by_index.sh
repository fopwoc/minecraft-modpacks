#!/bin/bash
# inputs line and index of var and returns var by index
set -e

echo "$1" | cut -d',' -f"$2"
