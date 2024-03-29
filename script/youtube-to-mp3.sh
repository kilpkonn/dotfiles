#!/bin/bash

# Input info
url=$1 # Video URL
file_mp3=$2 # Final filename (Artist - Title)
file_mp3=$file_mp3'.mp3'

# Update youtube-dl
# sudo pip3 install --upgrade youtube-dl

# Download youtube video to file
youtube-dl -x --audio-format mp3 $url -o "output.mp3"

# Get values and put tag information
artist=$(echo $file_mp3 | awk -F' - ' '{print $1}')
title=$(echo $file_mp3 | awk -F' - ' '{print $2}' | awk -F'.' '{print $1}')
ffmpeg -loglevel quiet -i output.mp3 -metadata artist="$artist" -metadata title="$title" "$file_mp3"

# Delete temporary files
rm output.mp3

# Print file informations
#ffprobe "$file_mp3" 2>&1 | grep -A90 'Metadata:'
