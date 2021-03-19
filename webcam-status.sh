#!/bin/bash
lsmod | grep uvcvideo > /dev/null 2>&1

if [ $? -eq 0 ]; then
    echo "Webcam: enabled"
    exit 0
fi

echo "Webcam: disabled"
exit 0