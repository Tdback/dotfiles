#!/bin/sh
languages=$(cat "${XDG_CONFIG_HOME}/tmux/tmux-cht-languages" "${XDG_CONFIG_HOME}/tmux/tmux-cht-programs")

selected=$(printf "%s" "$languages" | fzf)

[ -z "$selected"  ] && exit 0

printf "Enter Query: " && read -r query

tmux neww bash -c "curl cht.sh/$selected/$(echo "$query" | tr ' ' '+') & while [ : ]; do sleep 1; done"
