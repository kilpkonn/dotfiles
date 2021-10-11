#!/bin/sh -e

selection=$(hacksaw -s 2);
sleep 1;
shotgun -g $selection - | xclip -t 'image/png' -sel c
