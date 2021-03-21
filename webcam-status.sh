#!/bin/bash

lsmod | grep uvcvideo > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "Webcam: enabled"
else 
    echo "Webcam: disabled"
fi

grep "uvcvideo" /etc/modprobe.d/blacklist.conf > /dev/null 2>&1
if [ ! $? -eq 0 ]; then
    echo "Webcam default: enabled"
else 
    echo "Default: disabled"
fi

exit 0