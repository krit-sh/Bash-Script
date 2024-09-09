#!/bin/bash

input_dir="/path/to/input/directory"  # Replace with the path to your input files
output_dir="/path/to/output/directory"  # Replace with the path to your output files
input_ext="webp"  # Replace with your input image extension (e.g., webp, jpg)
output_ext="png"  # Replace with your desired output image extension (e.g., png, jpg)

mkdir -p "$output_dir"

for file in "$input_dir"/*."$input_ext"; do
    ffmpeg -i "$file" "$output_dir/$(basename "${file%.*}").$output_ext"
done
