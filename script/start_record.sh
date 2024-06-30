#!/bin/sh
#
# record - record an area of the screen

dir=~/medias/videos/records
current="$(date +%F_%H-%M-%S)"

mkdir -p $dir

hacksaw -n | {
    IFS=+x read -r w h x y

    w=$((w + w % 2))
    h=$((h + h % 2))

    ffmpeg               \
        -v 16            \
        -r 30            \
        -f x11grab       \
        -s "${w}x${h}"   \
        -i "${DISPLAY}.0+$x,$y"  \
        -preset slow     \
        -c:v h264        \
        -pix_fmt yuv420p \
        -crf 20          \
        "${dir}/${current}.mp4" # &

    # ffmpeg -f alsa -ac 2 -i pulse -- "${dir}/${current}.wav"
}

