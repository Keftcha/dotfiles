#!/usr/bin/env bash

# for each images in ~/images/wallpapers, feh change the wallpaper each minutes

while true; do
    images=$(ls ~/Pictures/wallpapers/)
    for img in $images; do
        feh --no-fehbg --bg-fill ~/Pictures/wallpapers/$img
        sleep 60 # change wallpaper each minute
    done
done
