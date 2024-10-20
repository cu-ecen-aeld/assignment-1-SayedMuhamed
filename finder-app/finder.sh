#!/bin/sh

# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
    echo "Error: Two arguments are required - a path to a directory and a text string."
    exit 1
fi

filesdir="$1"
searchstr="$2"

# Check if the provided path is a directory
if [ ! -d "$filesdir" ]; then
    echo "Error: '$filesdir' is not a valid directory."
    exit 1
fi

# Count the number of files and matching lines
filesCount=$(find "$filesdir" -type f | wc -l)
matchCount=$(grep -r "$searchstr" "$filesdir" | wc -l)

# Print the results
echo "The number of files are $filesCount and the number of matching lines are $matchCount."
exit 0
