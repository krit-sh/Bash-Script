#!/bin/bash

detect_pkg_manager() {
    if command -v apt &> /dev/null; then
        PKG_MANAGER="apt"
    elif command -v dnf &> /dev/null; then
        PKG_MANAGER="dnf"
    elif command -v pacman &> /dev/null; then
        PKG_MANAGER="pacman"
    else
        echo "Unsupported package manager!"
        exit 1
    fi
}

perform_update() {
    case "$PKG_MANAGER" in
        apt) apt update && apt upgrade -y ;;
        dnf) dnf upgrade -y ;;
        pacman) pacman -Syu --noconfirm ;;
    esac
}

schedule_updates() {
    CRON_JOB="0 0 * * 7 $0"
    (crontab -l 2>/dev/null; echo "$CRON_JOB") | crontab -
    echo "Updates scheduled every Sunday at midnight."
}

main() {
    [ "$EUID" -ne 0 ] && echo "Please run as root." && exit 1
    detect_pkg_manager
    perform_update
    schedule_updates
}

main
