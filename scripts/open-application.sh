#!/bin/bash
# Open application or switch to window
# example: open-application.sh firefox
if top -b -n 1 | grep "$1" > /dev/null
then
   wmctrl -xa $1
else
    $1&
fi
