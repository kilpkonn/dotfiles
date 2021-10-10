#!/bin/bash

bg="$(ls /usr/share/backgrounds/ | shuf -n 1)" && i3lock -i "/usr/share/backgrounds/${bg}"
