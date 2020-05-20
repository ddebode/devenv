#!/bin/bash

giturl=$(git config --get remote.origin.url)

if [[ "$giturl" == *"https://"* ]]; then
  open "$giturl"
else
    updated_url=`echo "$giturl" | sed -e 's/:/\//g'  -e 's/git@/https:\/\//g' -e 's/\.git//g'`
    open $updated_url
fi
