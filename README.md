# Webcam-Utils

A small collection of scripts to enable, disable, set the default state and check the state of the webcam on ubuntu systems.

## Scripts

* `webcam-enable.sh`
    Enables the webcam of a device by loading the kernel module `uvcvideo`. 
* `webcam-disable.sh` 
    Disables the webcam of a device by removing the loaded `uvcvideo` kernel module.
* `webcam-status.sh` 
    Shows the webcam status (enabled/disabled) by looking up the loaded kernel modules. 
* `webcam-set-default.sh`
    Sets the default state of the webcam (enabled/disabled) by adding or removing the `uvcvideo` kernel module to the modprobe blacklist.

## Dependencies

```
sudo apt install make devscripts
```

## Build DEB-Package

```bash
$ make 
# or
$ make package
```

## Setup without installing as debian package
```bash
$ sudo make install
```