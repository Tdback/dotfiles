#!/usr/bin/env bash

# Kill any instances of polybar running
killall -q polybar

# Wait for polybar process(es) to shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch polybar
polybar main -c $(dirname $0)/config.ini &
