#!/bin/bash
# takes index, and prints line if it exist
set -e

if [ -z "$1" ]
then
      echo "index is empty"
      exit 1
fi

LINE=$(sed -n "$1p" < version.csv)

if [ -z "$LINE" ]
then
      echo "line $1 is empty"
      exit 1
else
      echo "$LINE"
fi
