#!/bin/bash

# Your Azure VM Public IP
VM_PUBLIC_IP="20.198.20.137"

# Path to the .env file
file_to_find="../backend/.env.docker"

# Target URL we want to set
new_url="FRONTEND_URL=\"http://${VM_PUBLIC_IP}:5173\""

# Read the current FRONTEND_URL line
current_url=$(sed -n "4p" $file_to_find)

# Update only if value changed
if [[ "$current_url" != "$new_url" ]]; then
    if [ -f $file_to_find ]; then
        sed -i -e "s|FRONTEND_URL.*|$new_url|g" $file_to_find
        echo "UPDATED → $new_url"
    else
        echo "ERROR: File not found at $file_to_find"
    fi
else
    echo "FRONTEND_URL already correct. No update needed."
fi
