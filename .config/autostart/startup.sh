#!/usr/bin/env bash

# Set key-repetition rate
xset r rate 350 40

# Start Emacs daemon if not already started
if [[ ! $(ps aux | grep -q "[e]macs --daemon") ]]; then
  emacs --daemon
fi
