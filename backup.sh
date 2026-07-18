#!/bin/bash

# ==============================================================================
# Script: backup.sh
# Purpose: Creates a timestamped .tar.gz archive of a specified directory.
# ==============================================================================

# Check if the user provided an argument
if [ -z "$1" ]; then
  echo "Usage: ./backup.sh <directory_to_backup>"
  exit 1
fi

TARGET_DIR=$1

# Check if the provided argument is an actual directory
if [ ! -d "$TARGET_DIR" ]; then
  echo "Error: Directory '$TARGET_DIR' does not exist."
  exit 1
fi

# Generate variables for the filename
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
DIR_NAME=$(basename "$TARGET_DIR")
BACKUP_FILE="${DIR_NAME}_backup_${TIMESTAMP}.tar.gz"

echo "Backing up '$TARGET_DIR' to '$BACKUP_FILE'..."

# Create the compressed tarball
tar -czf "$BACKUP_FILE" "$TARGET_DIR"

# Verify if the tar command succeeded
if [ $? -eq 0 ]; then
  echo "Success! Backup saved as $BACKUP_FILE"
else
  echo "Error: Backup failed!"
  exit 1
fi
