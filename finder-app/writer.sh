#!/bin/sh

# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
    echo "Error: Two arguments are required - a full path to a file and a text string."
    exit 1
fi

writefile="$1"
writestr="$2"

# Create the directory path if it doesn't exist
dirpath=$(dirname "$writefile")
if [ ! -d "$dirpath" ]; then
    mkdir -p "$dirpath" || { echo "Error: Could not create directory path '$dirpath'"; exit 1; }
fi

# Write the string to the file, overwriting if it exists
echo "$writestr" > "$writefile" || { echo "Error: Could not create or write to file '$writefile'"; exit 1; }

echo "Successfully wrote to '$writefile'."
exit 0
