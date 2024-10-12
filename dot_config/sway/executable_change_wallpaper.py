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
LOCK_FILE = "/tmp/wallpaper_changer.lock"

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


def is_another_instance_running():
    if os.path.exists(LOCK_FILE):
        with open(LOCK_FILE, "r") as f:
            pid = f.read().strip()
            if pid and pid.isdigit() and os.path.exists(f"/proc/{pid}"):
                return True

    with open(LOCK_FILE, "w") as f:
        _ = f.write(str(os.getpid()))
    return False


def cleanup():
    if os.path.exists(LOCK_FILE):
        os.remove(LOCK_FILE)


if __name__ == "__main__":
    try:
        if is_another_instance_running():
            print("Another instance is already running.")
            sys.exit(0)

        if "--change-now" in sys.argv:
            change_wallpaper()
        else:
            if not is_another_instance_running():
                while True:
                    change_wallpaper()
                    time.sleep(INTERVAL_SECONDS)
            else:
                sys.exit(0)
    finally:
        cleanup()
