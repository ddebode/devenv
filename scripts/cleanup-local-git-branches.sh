#!/bin/bash
# Use force as argument to force delete branches
git checkout master;
delete_arg='-d'
if [[ $1 == "force" ]]; then
    echo "Use the force Luke."
    delete_arg="-D"
fi

branches=$(git fetch -p && git branch -vv | awk '/: gone]/{print $1}')
for branch in $branches
do
    while true; do
	read -p "$branch is not more on remote. Delete local branch?: '$branch' (Yy or Nn) : " answer
	case $answer in
	    [Yy]* ) git branch $delete_arg $branch; break;;
	    [Nn]* ) break;;
	    * ) echo "Please answer yes or no.";;
	esac
    done
done
