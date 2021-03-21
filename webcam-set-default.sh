#!/bin/bash

new_state="$1"
current_state="enabled"

grep "uvcvideo" /etc/modprobe.d/blacklist.conf > /dev/null 2>&1

if [[ $? -eq 0 ]]; then
    current_state="disabled"
fi

if [[ $new_state == $current_state ]]; then
    echo "Webcam is already by default $current_state."
    exit 0
fi

if [[ $new_state == "enabled" ]]; then
    sudo sed -i "/blacklist uvcvideo/d" /etc/modprobe.d/blacklist.conf
    echo "Webcam default has been set to enabled."
elif [[ $new_state == "disabled" ]]; then
    sudo sh -c "echo 'blacklist uvcvideo' >> /etc/modprobe.d/blacklist.conf"
    echo "Webcam default has been set to disabled."
else 
    echo "Sets the webcam default state after the system start."
    echo
    echo "Syntax: webcam-set-default [enabled|disabled]"
    echo
fi