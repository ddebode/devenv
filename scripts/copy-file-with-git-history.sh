#!/bin/bash
# Give as argument the relative path to file which should be copied to other repo
# other-repo must be in same directory as current repo 

[ -z "$1" ] && echo "No path to file given as argument" && exit 1

# Create folder to stores patches
temp_dir="/tmp/temp-patches"
[ ! -d $temp_dir ] && mkdir $temp_dir && echo "created dir $temp_dir"
rm $temp_dir/*

# Create patches
git format-patch --root -o $temp_dir $1

# Goto repo
other_repo="../other-repo"
[ ! -d $other_repo ] && echo "Library project not in same directory as current repo" && exit 1
cd $other_repo

# Apply patch
current_branch=$(git branch | grep \* | cut -d ' ' -f2)
[ "$current_branch" = "master" ] &&  read -p "other-repo is on master branch. Continue?" 
git am /tmp/temp-patches/*.patch
echo "Patches are applied to other-repo, move file with 'git mv' to correct folder before pushing!!"

read -p "Move file with git mv. Destination in other-repo:" destination
git mv $1 $destination

echo  "Finished, goto other-repo library and cleanup and view commits. If something went wrong use git reset or git am --abort"
