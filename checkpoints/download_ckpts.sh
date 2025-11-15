#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

MODELS_DIR="${PROJECT_ROOT}/models"
mkdir -p "$MODELS_DIR"

SAM2p1_BASE_URL="https://dl.fbaipublicfiles.com/segment_anything_2/092824"
CHECKPOINT_URL="${SAM2p1_BASE_URL}/sam2.1_hiera_small.pt"
OUTPUT_PATH="${MODELS_DIR}/sam2.1_hiera_small.pt"

echo "Downloading sam2.1_hiera_small.pt to $OUTPUT_PATH ..."

if command -v wget &> /dev/null; then
    wget -O "$OUTPUT_PATH" "$CHECKPOINT_URL"
elif command -v curl &> /dev/null; then
    curl -L -o "$OUTPUT_PATH" "$CHECKPOINT_URL"
else
    echo "Please install wget or curl."
    exit 1
fi

# Validate download
if [ ! -f "$OUTPUT_PATH" ] || [ ! -s "$OUTPUT_PATH" ]; then
    echo " Download failed or file is empty."
    exit 1
fi

echo "Download complete: $OUTPUT_PATH"
