#!/bin/python

import os
import subprocess
import random
import time
import sys
from pathlib import Path

IMAGE_SUFFIXES = (".png", ".jpg", ".jpeg")
IMAGE_DIRS = [
    "~/Pictures/wallpapers/",
    "~/Repos/Wallpaper-Bank/wallpapers/",
    "~/Repos/catppuccin-wallpapers/",
]
INTERVAL_SECONDS = 30 * 60

all_images: set[Path] = set()
for image_dir in IMAGE_DIRS:
    expanded_dir = Path(os.path.expanduser(image_dir)).resolve()
    for file_path in expanded_dir.rglob("*"):
        if file_path.suffix.lower() in IMAGE_SUFFIXES:
            all_images.add(file_path)

images = list(all_images)


def change_wallpaper():
    for output in ["eDP-1", "HDMI-A-1"]:
        image = random.choice(images)

        _ = subprocess.run(
            [
                "swww",
                "img",
                "--outputs",
                output,
                str(image),
                "--transition-type",
                "random",
                "--transition-fps",
                "60",
            ]
        )


if "--change-now" in sys.argv:
    change_wallpaper()
else:
    while True:
        change_wallpaper()
        time.sleep(INTERVAL_SECONDS)
