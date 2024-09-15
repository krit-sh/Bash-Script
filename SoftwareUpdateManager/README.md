```md
# Simplified Software Update Manager Script

This Bash script automates the process of updating and upgrading installed software packages on Linux systems. It supports multiple package managers (`apt`, `dnf`, and `pacman`), and schedules automatic updates using `cron`.

## Features

- Automatically detects the package manager (supports `apt`, `dnf`, and `pacman`).
- Performs package list updates and upgrades.
- Schedules updates to run automatically every Sunday at midnight using `cron`.
- Lightweight and simple to use.

## Requirements

- **Root Privileges**: The script must be run as `root` or with `sudo`.
- A supported Linux distribution:
  - **Debian/Ubuntu** (uses `apt`)
  - **Fedora/RHEL** (uses `dnf`)
  - **Arch Linux** (uses `pacman`)

## Usage

1. Clone or download the script to your local machine:
   ```bash
   git clone https://github.com/krit-sh/update-manager-script.git
   cd update-manager-script
   ```

2. Make the script executable:
   ```bash
   chmod +x update_manager.sh
   ```

3. Run the script with root privileges:
   ```bash
   sudo ./update_manager.sh
   ```

The script will:

- Detect your package manager.
- Perform an update and upgrade of your installed packages.
- Schedule future updates to run every Sunday at midnight.

### Example Output

```bash
$ sudo ./update_manager.sh
Detected package manager: apt
Updating and upgrading packages...
Updates scheduled every Sunday at midnight.
```

## Scheduling Updates

The script automatically schedules a `cron` job to perform updates every Sunday at midnight. The following cron entry is added:

```
0 0 * * 7 /path/to/update_manager.sh
```

To view or modify the cron jobs, you can use the following command:

```bash
crontab -l
```

## Customization

- To change the update schedule, modify the `CRON_JOB` variable inside the script:
  
  ```bash
  CRON_JOB="0 0 * * 7 $0"  # Current schedule (Sunday at midnight)
  ```

  Adjust the timing as per your needs.
