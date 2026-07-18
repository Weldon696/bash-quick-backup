# Bash Quick Backup

A very simple, one-file Bash utility to compress and back up directories with an automatic timestamp.

## Features
* No dependencies (uses standard `tar` and `date` commands).
* Automatically appends the current date and time to the backup filename.
* Fails gracefully if the target directory doesn't exist.

## Usage

1. Clone the repository and make the script executable:
   ```bash
   chmod +x backup.sh
