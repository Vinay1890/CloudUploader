# CloudUploader CLI

## Overview

`CloudUploader` is a simple bash-based CLI tool that allows users to upload files to Azure Blob Storage quickly.

## Prerequisites

- Azure CLI installed and configured.
- Azure Storage account and access key.

## Setup

1. Clone the repository:
    ```bash
    git clone https://github.com/yourusername/CloudUploader.git
    cd CloudUploader
    ```

2. Set up your Azure Storage credentials and container name in your `.bashrc` or `.bash_profile`:
    ```bash
    export AZURE_STORAGE_ACCOUNT="your_storage_account"
    export AZURE_CONTAINER_NAME="your_container_name"
    ```

3. Apply the changes:
    ```bash
    source ~/.bashrc
    ```
    or
    ```bash
    source ~/.bash_profile
    ```

## Usage

To upload a file to Azure Blob Storage:
```bash
./clouduploader.sh /path/to/file [target_directory]

