import cv2
import numpy as np
from PIL import Image
from datasets import load_dataset, DatasetDict

def load_and_split_dataset(repo_id):
    dataset = load_dataset(repo_id)
    train_test_split = dataset["train"].train_test_split(test_size=0.15, seed=42)
    val_test_split = train_test_split["test"].train_test_split(test_size=(2/3), seed=42)

    dataset_dict = DatasetDict({
        "train": train_test_split["train"],
        "validation": val_test_split["train"],
        "test": val_test_split["test"]
    })
    return dataset_dict
