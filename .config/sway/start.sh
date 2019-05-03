#!/bin/sh
# Software
redshift &
onedrive -m --syncdir /home/felix/OneDrive &

# Add 4coder path
export PATH="${PATH}:/home/felix/4coder_default/"

sway
