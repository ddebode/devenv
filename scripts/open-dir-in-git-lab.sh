#!/bin/bash
branch=$(git branch | grep \* | cut -d ' ' -f2)
full_path=${PWD}
current_dir=${PWD##*/}
url='https://gitlab.tools.com/seo/'$current_dir'/tree/'$branch
open $url
