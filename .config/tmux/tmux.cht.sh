#!/bin/sh
languages=$(echo "awk bash c cpp golang ocaml python rust sed" | tr ' ' '\n')

selected=$(printf "%s" "$languages" | fzf)

[ -z "$selected"  ] && exit 0

printf "Enter Query: " && read -r query

tmux neww bash -c "curl cht.sh/$selected/$(echo "$query" | tr ' ' '+') & while [ : ]; do sleep 1; done"
