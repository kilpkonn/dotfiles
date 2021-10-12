#!/bin/bash

bg_img="/usr/share/backgrounds/$(ls /usr/share/backgrounds/ | shuf -n 1)";
screen_dimensions="$(xdpyinfo | grep dimensions | sed -r 's/^[^0-9]*([0-9]+x[0-9]+).*$/\1/')"

 convert $bg_img -resize ${screen_dimensions} RGB:- | i3lock --raw ${screen_dimensions}:rgb --image /dev/stdin

