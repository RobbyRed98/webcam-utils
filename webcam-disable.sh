#!/bin/bash
lsmod | grep uvcvideo > /dev/null 2>&1

if [ $? -eq 1 ]; then
    echo "Webcam is already disabled."
    exit 0
fi

sudo modprobe -r uvcvideo
echo "Disabled webcam."

exit 0