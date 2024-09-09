# Image Format Conversion Script

This bash script is designed to automate the conversion of image files from one format to another using FFmpeg.

### Description of the Script

- The script takes all image files from a specified input directory and converts them to a desired output format, saving the converted files in a specified output directory.
- By default, the script is set to convert `.webp` files to `.png` format, but you can easily modify the file extensions for both input and output.
- FFmpeg is used to perform the conversion, ensuring a seamless transformation between image formats.

---

## How to Use the Script

Step 1: Open the script and replace the following placeholders with your actual paths and file extensions:
- `input_dir`: The directory containing the input image files.
- `output_dir`: The directory where the converted image files will be saved.
- `input_ext`: The file extension of the input images (e.g., `webp`, `jpg`).
- `output_ext`: The desired file extension for the output images (e.g., `png`, `jpg`).

Step 2: Open your terminal and navigate to the script's directory.

Step 3: Run the script by typing:

```
bash convert_images.sh
```

---

This script simplifies the process of converting multiple image files at once, providing a convenient and efficient solution for image format conversions.
