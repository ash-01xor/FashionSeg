#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Project root = parent folder of checkpoints/
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

# Create models folder at project root
MODELS_DIR="${PROJECT_ROOT}/models"
mkdir -p "$MODELS_DIR"

# Detect wget/curl
if command -v wget &> /dev/null; then
    CMD="wget -O"
elif command -v curl &> /dev/null; then
    CMD="curl -L -o"
else
    echo "Please install wget or curl."
    exit 1
fi

SAM2_BASE_URL="https://dl.fbaipublicfiles.com/segment_anything_2/072824"
SAM2_SMALL_URL="${SAM2_BASE_URL}/sam2_hiera_small.pt"

echo "Downloading sam2_hiera_small.pt ..."
$CMD "$MODELS_DIR/sam2_hiera_small.pt" "$SAM2_SMALL_URL" || {
    echo "Failed to download"
    exit 1
}

echo "Downloaded to: $MODELS_DIR/sam2_hiera_small.pt"
