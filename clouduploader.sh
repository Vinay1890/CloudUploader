#!/bin/bash

# CloudUploader CLI for Azure Blob Storage

# Function to display usage information
function usage() {
    echo "Usage: $0 /path/to/file.txt"
    exit 1
}

# Check if Azure CLI is installed
if ! command -v az &> /dev/null; then
    echo "Azure CLI is not installed. Please install it and try again."
    exit 1
fi

# Check if correct number of arguments is provided
if [ "$#" -ne 1 ]; then
    usage
fi

FILE_PATH=$1

# Check if file exists
if [ ! -f "$FILE_PATH" ]; then
    echo "File $FILE_PATH does not exist."
    exit 1
fi

# Get the storage account and container from environment variables or config file
STORAGE_ACCOUNT=${AZURE_STORAGE_ACCOUNT:-"your_storage_account"}
CONTAINER_NAME=${AZURE_CONTAINER_NAME:-"your_container_name"}

if [ -z "$STORAGE_ACCOUNT" ] || [ -z "$CONTAINER_NAME" ]; then
    echo "Azure storage account or container not set. Please configure them."
    exit 1
fi

# Upload file to Azure Blob Storage
echo "Uploading $FILE_PATH to https://$STORAGE_ACCOUNT.blob.core.windows.net/$CONTAINER_NAME..."
az storage blob upload --account-name "$STORAGE_ACCOUNT" --container-name "$CONTAINER_NAME" --name "$(basename "$FILE_PATH")" --file "$FILE_PATH" --auth-mode login

if [ $? -eq 0 ]; then
    echo "File uploaded successfully."
else
    echo "File upload failed."
    exit 1
fi

