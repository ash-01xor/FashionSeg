import cv2
import numpy as np
import pandas as pd
from PIL import Image
from datasets import load_dataset, DatasetDict
from huggingface_hub import hf_hub_download

def load_and_split_dataset(repo_id):
    
    csv_path = hf_hub_download(repo_id=repo_id, filename='train.csv', repo_type='dataset')
    df = pd.read_csv(csv_path)  
    filenames = df['imageid'].tolist()
    dataset = load_dataset(repo_id,split='train')
    dataset = dataset.add_column("filename",filenames)
    train_test_split = dataset.train_test_split(test_size=0.10, seed=42)
    val_test_split = train_test_split["test"].train_test_split(test_size=0.50, seed=42)

    dataset_dict = DatasetDict({
        "train": train_test_split["train"],
        "validation": val_test_split["train"],
        "test": train_test_split["test"]
    })
    return dataset_dict
