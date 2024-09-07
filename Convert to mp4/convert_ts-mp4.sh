for file in /path/to/your/mkv/files/*.ts; do
    ffmpeg -i "$file" -c:v copy -c:a copy "/path/to/output/directory/$(basename "${file%.*}").mp4"
done

