#!/bin/bash

OUTPUT_FILE="bookmarks.md"

extract_chrome_bookmarks() {
    case "$OSTYPE" in
        linux*)   CHROME_BOOKMARKS_PATH="$HOME/.config/google-chrome/Default/Bookmarks"
                  CHROMIUM_BOOKMARKS_PATH="$HOME/.config/chromium/Default/Bookmarks" ;;
        darwin*)  CHROME_BOOKMARKS_PATH="$HOME/Library/Application Support/Google/Chrome/Default/Bookmarks"
                  CHROMIUM_BOOKMARKS_PATH="$HOME/Library/Application Support/Chromium/Default/Bookmarks" ;;
        msys*|cygwin*|win32*) CHROME_BOOKMARKS_PATH="$APPDATA/Google/Chrome/User Data/Default/Bookmarks"
                              CHROMIUM_BOOKMARKS_PATH="$LOCALAPPDATA/Chromium/User Data/Default/Bookmarks" ;;
        *)        echo "Unsupported OS: $OSTYPE" && return ;;
    esac

    if [ -f "$CHROME_BOOKMARKS_PATH" ]; then
        BOOKMARKS_PATH="$CHROME_BOOKMARKS_PATH"
    elif [ -f "$CHROMIUM_BOOKMARKS_PATH" ]; then
        BOOKMARKS_PATH="$CHROMIUM_BOOKMARKS_PATH"
    else
        echo "Chrome/Chromium bookmarks file not found."
        return
    fi

    echo "Chrome/Chromium Bookmarks:" >> "$OUTPUT_FILE"
    jq -r '.roots.bookmark_bar.children[] | select(.type == "url") | .name + " - " + .url' "$BOOKMARKS_PATH" >> "$OUTPUT_FILE"
    echo >> "$OUTPUT_FILE"
}

extract_firefox_bookmarks() {
    case "$OSTYPE" in
        linux*)   FIREFOX_PROFILE_PATH=$(find $HOME/.mozilla/firefox -name "*.default-release" -print -quit) ;;
        darwin*)  FIREFOX_PROFILE_PATH=$(find "$HOME/Library/Application Support/Firefox/Profiles" -name "*.default-release" -print -quit) ;;
        msys*|cygwin*|win32*) FIREFOX_PROFILE_PATH=$(find "$APPDATA/Mozilla/Firefox/Profiles" -name "*.default-release" -print -quit) ;;
        *)        echo "Unsupported OS: $OSTYPE" && return ;;
    esac

    if [ -z "$FIREFOX_PROFILE_PATH" ]; then
        echo "Firefox profile not found."
        return
    fi

    FIREFOX_BOOKMARKS_DB="$FIREFOX_PROFILE_PATH/places.sqlite"
    if [ ! -f "$FIREFOX_BOOKMARKS_DB" ]; then
        echo "Firefox bookmarks database not found."
        return
    fi

    echo "Firefox Bookmarks:" >> "$OUTPUT_FILE"
    sqlite3 "$FIREFOX_BOOKMARKS_DB" "SELECT moz_bookmarks.title, moz_places.url FROM moz_bookmarks JOIN moz_places ON moz_bookmarks.fk = moz_places.id WHERE moz_bookmarks.type = 1" | while IFS='|' read -r title url; do
        echo "$title - $url" >> "$OUTPUT_FILE"
    done
    echo >> "$OUTPUT_FILE"
}

if ! command -v jq &> /dev/null; then
    echo "jq is not installed. Please install jq to proceed."
    exit 1
fi

if ! command -v sqlite3 &> /dev/null; then
    echo "sqlite3 is not installed. Please install sqlite3 to proceed."
    exit 1
fi

> "$OUTPUT_FILE"

if [[ "$OSTYPE" == "linux-gnu"* || "$OSTYPE" == "darwin"* ]]; then
    if pgrep -x "firefox" > /dev/null; then
        echo "Firefox is running. Please close Firefox and try again."
        exit 1
    fi
fi

extract_chrome_bookmarks

extract_firefox_bookmarks

echo "Bookmarks have been saved to $OUTPUT_FILE"
