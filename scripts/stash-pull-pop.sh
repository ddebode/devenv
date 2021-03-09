#!/bin/bash
if [ -z "$(git status --porcelain)" ]; then 
  echo "nothing to stash"
  git pull;
else
  echo "stash pull pop"
  git stash; 
  git pull; 
  git stash pop
fi
