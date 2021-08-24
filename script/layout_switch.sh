#!/bin/zsh
 
# If an explicit layout is provided as an argument, use it. Otherwise, select the next layout from
# the set [us, ee].
if [[ -n "$1" ]]; then
    setxkbmap $1
else
    layout=$(setxkbmap -query | awk '$1 ~ /^layout/ {print $2}')
    echo $layout
    case $layout in
        us)
            setxkbmap ee
            ;;
        *)
            setxkbmap us
            ;;
    esac
fi
