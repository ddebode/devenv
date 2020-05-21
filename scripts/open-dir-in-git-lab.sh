#!/bin/bash
branch=$(git branch | grep \* | cut -d ' ' -f2)
full_path=${PWD}
current_dir=${PWD##*/}
url='https://gitlab.tools.com/seo/'$current_dir'/tree/'$branch

if [[ "$OSTYPE" == "darwin"* ]]; then
    open $url
else	
    xdg-open $url
fi
