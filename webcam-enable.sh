#!/bin/bash
lsmod | grep uvcvideo > /dev/null 2>&1

if [ $? -eq 0 ]; then
    echo "Webcam is already enabled."
    exit 0
fi

sudo modprobe uvcvideo
echo "Enabled webcam."

exit 0