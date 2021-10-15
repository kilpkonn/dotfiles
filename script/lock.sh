#!/bin/bash

WIDTH_X_HEIGHT_REGEX="([0-9]+)x([0-9]+)"

bg_img="/usr/share/backgrounds/$(ls /usr/share/backgrounds/ | shuf -n 1)";
screen_dimensions="$(xdpyinfo | grep dimensions | sed -r 's/^[^0-9]*([0-9]+x[0-9]+).*$/\1/')"
img_size="$(identify -format '%wx%h' $bg_img)"

if [[ $screen_dimensions =~ $WIDTH_X_HEIGHT_REGEX ]]; then
  screen_width=${BASH_REMATCH[1]}
  screen_height=${BASH_REMATCH[2]}
fi

if [[ $img_size =~ $WIDTH_X_HEIGHT_REGEX ]]; then
  img_width=${BASH_REMATCH[1]}
  img_height=${BASH_REMATCH[2]}
fi

if [ $screen_width -eq $img_width ] && [ $screen_height -eq $img_height ]; then
  i3lock -i $bg_img 
elif [ $screen_width -lt $img_width ] && [ $screen_height -lt $img_height ]; then
  convert $bg_img -resize ${screen_dimensions} RGB:- | i3lock --raw ${screen_dimensions}:rgb --image /dev/stdin
else 
  i3lock -t -i $bg_img
fi

# convert $bg_img -resize ${screen_dimensions} RGB:- | i3lock --raw ${screen_dimensions}:rgb --image /dev/stdin
# i3lock -t -i $bg_img
