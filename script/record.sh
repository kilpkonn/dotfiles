#!/bin/sh
#
# record - record an area of the screen

dir=~/medias/videos/records
current=$(date +%F_%H-%M-%S)

mkdir -p "$dir"

ffmpeg               \
    -v 16            \
    -r 30            \
    -f x11grab       \
    -s "3840x2160"   \
    -i "$DISPLAY"    \
    -preset slow     \
    -c:v h264        \
    -pix_fmt yuv420p \
    -crf 20          \
    "$dir/$current.mp4"

