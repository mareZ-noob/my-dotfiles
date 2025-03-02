#!/bin/bash

# Directory containing wallpaper images
WALLPAPER_DIR="$HOME/Downloads/Pictures"

# Check if directory exists
if [ ! -d "$WALLPAPER_DIR" ]; then
    echo "Error: Directory $WALLPAPER_DIR does not exist."
    exit 1
fi

# Get all image files from the directory
# Supports common image formats
# IMAGE_FILES=($WALLPAPER_DIR/*.{jpg,jpeg,png,gif,bmp})
IMAGE_FILES=($WALLPAPER_DIR/*.{jpg,png})

# Count the number of image files
NUM_FILES=${#IMAGE_FILES[@]}

# Check if there are any image files
if [ $NUM_FILES -eq 0 ]; then
    echo "Error: No image files found in $WALLPAPER_DIR."
    exit 1
fi

# Select a random image
RANDOM_IMAGE=${IMAGE_FILES[$RANDOM % $NUM_FILES]}

# Set the wallpaper
# First try with gsettings (GNOME)
if command -v gsettings &> /dev/null; then
    gsettings set org.gnome.desktop.background picture-uri "file://$RANDOM_IMAGE"
    gsettings set org.gnome.desktop.background picture-uri-dark "file://$RANDOM_IMAGE"
    echo "Wallpaper set using gsettings: $RANDOM_IMAGE"
# Try with feh (lightweight window managers)
elif command -v feh &> /dev/null; then
    feh --bg-fill "$RANDOM_IMAGE"
    echo "Wallpaper set using feh: $RANDOM_IMAGE"
# Try with xwallpaper
elif command -v xwallpaper &> /dev/null; then
    xwallpaper --zoom "$RANDOM_IMAGE"
    echo "Wallpaper set using xwallpaper: $RANDOM_IMAGE"
# Try with nitrogen
elif command -v nitrogen &> /dev/null; then
    nitrogen --set-zoom-fill "$RANDOM_IMAGE"
    echo "Wallpaper set using nitrogen: $RANDOM_IMAGE"
else
    echo "Error: No supported wallpaper setting tool found. Please install gsettings, feh, xwallpaper, or nitrogen."
    exit 1
fi
