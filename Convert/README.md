# Bash Conversion Scripts Repository

Welcome to my collection of Bash scripts designed to simplify the process of converting files between different formats. This repository includes scripts for converting video and image formats using powerful tools like FFmpeg, making format conversions efficient and straightforward.

## Features

- **Video Format Conversion**: Convert videos between popular formats (e.g., `.ts` to `.mp4`, `.mkv` to `.avi`) with scripts that retain quality by copying video and audio streams without re-encoding.
- **Image Format Conversion**: Easily switch between image formats (e.g., `.webp` to `.png`, `.jpg` to `.gif`) with batch conversion scripts.
- **Customizable**: All scripts are easily customizable to suit different file types, input/output directories, and conversion options.
- **Automated Processing**: Automate the tedious task of manually converting multiple files, whether for images or videos.

## How to Use

1. Clone or download the repository:
   ```bash
   git clone https://github.com/krit-sh/Bash-Script.git
   ```

2. Navigate to the script you need, open it, and modify the input/output paths or formats to fit your requirements.

3. Run the script from your terminal:
   ```bash
   bash script_name.sh
   ```

## Installing FFmpeg

FFmpeg is required to perform conversions in most of the scripts. Below are the instructions to install FFmpeg on different platforms:

### Linux (Ubuntu/Debian)
1. Open your terminal.
2. Update the package list and install FFmpeg:
   ```bash
   sudo apt update
   sudo apt install ffmpeg
   ```

3. Verify installation by checking the version:
   ```bash
   ffmpeg -version
   ```

### macOS (via Homebrew)
1. Open your terminal.
2. Install Homebrew (if not already installed):
   ```bash
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```

3. Use Homebrew to install FFmpeg:
   ```bash
   brew install ffmpeg
   ```

4. Verify the installation:
   ```bash
   ffmpeg -version
   ```

### Windows
1. Download the latest FFmpeg build from [FFmpeg.org](https://ffmpeg.org/download.html).
2. Extract the downloaded ZIP file.
3. Add the `bin` folder (from the extracted files) to your system's PATH:
   - Right-click on "This PC" > Properties > Advanced system settings > Environment Variables.
   - Under "System Variables," find `Path`, and click Edit.
   - Click New, then paste the path to the `bin` folder of FFmpeg.
   
4. Open Command Prompt and verify the installation:
   ```bash
   ffmpeg -version
   ```

Now you're ready to use the conversion scripts!
