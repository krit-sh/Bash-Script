#!/bin/bash

input_dir="/path/to/input/directory"  # Replace with the path to your input files
output_dir="/path/to/output/directory"  # Replace with the path to your output files
input_ext="ts"  # Replace with your input file extension (e.g., ts, mkv)
output_ext="mp4"  # Replace with your desired output extension (e.g., mp4)

mkdir -p "$output_dir"

for file in "$input_dir"/*."$input_ext"; do
    ffmpeg -i "$file" -c:v copy -c:a copy "$output_dir/$(basename "${file%.*}").$output_ext"
done

