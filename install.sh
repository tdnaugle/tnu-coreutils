#!/bin/bash

# Check if a filename argument is provided
if [ $# -ne 1 ]; then
    echo "Usage: $0 <filename.c>"
    exit 1
fi

# Extract the filename from the argument
C_FILE="$1"

# Check if the provided file exists
if [ ! -f "$C_FILE" ]; then
    echo "Error: File '$C_FILE' does not exist."
    exit 1
fi

echo "Beginning Installation"

# Extract the name of the binary (remove the .c extension)
BINARY_NAME="${C_FILE%.c}"

# Compile the C program and create the binary
gcc "$C_FILE" -o "$BINARY_NAME"


mv "$BINARY_NAME" ~/.local/bin


echo "Installation successful."
