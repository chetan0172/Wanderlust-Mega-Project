#!/bin/bash

# ============================
# Frontend ENV Auto-Updater
# Azure VM Public IP Version
# ============================

# Your Azure VM Public IP
VM_PUBLIC_IP="20.198.20.137"

# Path to the frontend .env file
file_to_find="../frontend/.env.docker"

# New API Path value to write
new_url="VITE_API_PATH=\"http://${VM_PUBLIC_IP}:31100\""

# Read the current value
current_url=$(grep -E '^VITE_API_PATH=' "$file_to_find")

# Update only if needed
if [[ "$current_url" != "$new_url" ]]; then
    if [[ -f "$file_to_find" ]]; then
        sed -i "s|^VITE_API_PATH.*|$new_url|g" "$file_to_find"
        echo "UPDATED → $new_url"
    else
        echo "ERROR: File not found at $file_to_find"
        exit 1
    fi
else
    echo "No update needed — VITE_API_PATH already correct."
fi
