# Video Format Conversion Script

This bash script is designed to automate the conversion of video files from one format to another using FFmpeg.

### Description of the Script

- The script takes all video files from a specified input directory and converts them to a desired output format, saving the converted files in a specified output directory.
- By default, the script is set to convert `.ts` files to `.mp4` format, but you can easily modify the file extensions for both input and output.
- FFmpeg is used to perform the conversion, copying both the video and audio streams without re-encoding, ensuring a fast and lossless process.

---

## How to Use the Script

Step 1: Open the script and replace the following placeholders with your actual paths and file extensions:
- `input_dir`: The directory containing the input video files.
- `output_dir`: The directory where the converted video files will be saved.
- `input_ext`: The file extension of the input videos (e.g., `ts`, `mkv`).
- `output_ext`: The desired file extension for the output videos (e.g., `mp4`, `avi`).

Step 2: Open your terminal and navigate to the script's directory.

Step 3: Run the script by typing:

```
bash convert_videos.sh
```

---

This script simplifies the tedious process of manually converting multiple video files, ensuring efficiency and consistency across video formats.
