# Browser Bookmarks Extraction Script

This Bash script extracts bookmarks from Google Chrome, Chromium, and Mozilla Firefox browsers and saves them in a markdown file (`bookmarks.md`). It is designed to work on Linux, macOS, and Windows, and it uses `jq` and `sqlite3` to parse the bookmark data from the respective browsers.

## Features

- **Chrome/Chromium Bookmarks Extraction**: The script retrieves bookmarks from both Chrome and Chromium browser bookmark files and formats them into a markdown format.
- **Firefox Bookmarks Extraction**: The script reads Firefox bookmarks directly from the `places.sqlite` database and exports them into the markdown file.
- **Cross-Platform Support**: The script works on Linux, macOS, and Windows by identifying the correct browser profile locations for each platform.
- **Automatic File Creation**: The extracted bookmarks are saved in a file called `bookmarks.md`.

## Requirements

- **jq**: A lightweight and flexible command-line JSON processor. Used to parse Chrome/Chromium bookmarks.
- **sqlite3**: A command-line interface for SQLite, required to query the Firefox bookmarks database.

### How to Install Dependencies

- **Linux**:
  ```bash
  sudo apt install jq sqlite3
  ```

- **macOS** (using Homebrew):
  ```bash
  brew install jq sqlite3
  ```

- **Windows** (via Git Bash):
  - Download and install `jq` and `sqlite3` binaries from their respective websites.

## How to Use

1. Ensure that both `jq` and `sqlite3` are installed on your system.
2. Close Firefox if it is running (necessary to read the bookmarks database).
3. Run the script:
   ```bash
   bash extract_bookmarks.sh
   ```

4. The bookmarks will be saved to `bookmarks.md` in the current directory.
