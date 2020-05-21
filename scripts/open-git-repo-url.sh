#!/bin/bash

url=$(git config --get remote.origin.url)

# transform origin url to https url
[[ "$url" == *"git@"* ]] && url=`echo "$url" | sed -e 's/:/\//g'  -e 's/git@/https:\/\//g' -e 's/\.git//g'`

# on macos use open
[[ "$OSTYPE" == "darwin"* ]] && open $url
# otherwise use xdg-open
xdg-open $url
