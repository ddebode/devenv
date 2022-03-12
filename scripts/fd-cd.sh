#!/bin/bash
# use source to execute this script
dir=$(fd -t d $1 | fzf) 
[[ ! -z "$dir" ]] && cd $dir
