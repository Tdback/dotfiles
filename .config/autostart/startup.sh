#!/usr/bin/env sh

################################################################################
# @author      : Tyler Dunneback (tylerdback@pm.me)
# @file        : startup.sh
# @created     : Wed Aug 30 01:59:27 PM EDT 2023
#
# @description : Commands to run on bspwm startup.
################################################################################

# Set key-repetition rate
xset r rate 350 40

# Always ensure Emacs daemon is running when bspwm is [re]started
if [ ! $(pgrep -f "emacs --daemon") ]
then
    emacs --daemon
fi
