import numpy as np
from PIL import Image
import matplotlib.pyplot as plt
import matplotlib.colors as mcolors

def viz_sample(dataset,index):
    sample = dataset[index]

    image = sample['image']
    mask = sample['label']

    fig , axes = plt.subplots(1,2, figsize=(10,5))
    axes[0].imshow(image)
    axes[0].set_title('Image')
    axes[0].axis('off')

    axes[1].imshow(mask, cmap='gray')
    axes[1].set_title('Mask')
    axes[1].axis('off')

    plt.tight_layout()
    plt.show()