#!/bin/bash

INPUT="github_structure.txt"

while IFS= read -r line
do
  if [[ "$line" == */ ]]; then
    # Create directory
    mkdir -p "$line"
    echo "Created folder: $line"
  else
    # Create parent folders if needed, then file
    mkdir -p "$(dirname "$line")"
    touch "$line"
    echo "Created file: $line"
  fi
done < "$INPUT"