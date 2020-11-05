#!/bin/sh
# Software
# onedrive -m --syncdir /home/felix/OneDrive &
onedrive --check-for-nosync -m &
mpd --kill
mpd &

# Add 4coder path
#export PATH="${PATH}:/home/felix/4coder_default/"

sway
