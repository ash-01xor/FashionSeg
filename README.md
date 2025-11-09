## FashionSeg

### Overview

This project focuses on fine-tuning the SAM2 (Segment Anything Model 2) model on a custom dataset for a specific object segmentation task. The goal is to adapt the model to recognize and segment objects of interest with high accuracy, using point-based prompts.

### Setup and installation

This project uses `uv` for fast and efficient package management.

1.  **Install `uv`:**
    ```bash
    pip install uv
    ```

2.  **Create and activate a virtual environment:**
    ```bash
    uv venv
    source .venv/bin/activate
    ```

3. **Install dependencies:**
    ```bash
    uv sync
    ```

4.  **Clone the official SAM2 Repository:**
    The model code is sourced directly from the official repository.
    ```bash
    git clone https://github.com/facebookresearch/segment-anything-2.git
    cd segment-anything-2
    pip install .
    cd ..
    ```

