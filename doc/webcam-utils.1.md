% webcam-utils(1) 0.2.1
% RobbyRed98
% March 2021

# NAME
webcam-utils - script collection containing webcam utilities

# SYNOPSIS

**webcam-status**<br>
**webcam-enable**<br>
**webcam-disable**<br>
**webcam-set-default** [*enable*|*disable*]

# DESCRIPTION

A small collection of scripts to enable, disable, set the default state and check the state of the webcam on ubuntu systems.

## webcam-enable
Enables the webcam of a device by loading the kernel module uvcvideo. 

## webcam-disable
Disables the webcam of a device by removing the loaded uvcvideo kernel module.

## webcam-status
Shows the webcam status (enabled/disabled) by looking up the loaded kernel modules. 

## webcam-set-default
Sets the default state of the webcam (enabled/disabled) by adding or removing the uvcvideo kernel module to the modprobe blacklist.

# EXAMPLE

**webcam-status**
: Shows the current and default state of the webcam.

**webcam-enable**
: Enables the webcam temporarily.

**webcam-disable**
: Disables the webcam temporarily.

**webcam-set-default enabled**
: Permanently enables the webcam by default.

**webcam-set-default disabled**
: Permanently disables the webcam by default.

# COPYRIGHT
Copyright (c) 2021 RobbyRed98 | MIT License