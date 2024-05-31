#!/bin/sh

# Set the working directory to the directory where the script resides
cd "$(dirname "$0")" || exit
ls
echo "Job Has Started🌱"| notify -bulk
# Read urls.txt file line by line and process each line
while IFS= read -r line; do
    # Process each line from urls.txt
    echo "$line" | subfinder -silent | httpx -silent | nuclei -t github_templates/ -severity critical,high,medium -o output.txt; notify -data output.txt
done < urls.txt
echo "Job Has Done🥀"| notify -bulk
