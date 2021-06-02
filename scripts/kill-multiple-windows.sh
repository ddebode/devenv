#!/bin/bash
# select with shift-enter in rofi

wmctrl -l | awk '{for(i=4;i<=NF;i++) printf "%s ",$i;print ""}' | rofi -dmenu -p "window" -multi-select | while read -r line; do wmctrl -c ${line}; done
