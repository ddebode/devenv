#!/bin/bash
# Script which you can pipe the maven output into and it will grep the interesting stuff for you at the end!
# This script is using rip-grep
# To keep the colors in the maven output use unbuffer (package expect-dev): unbuffer mvn clean install | <this script>

output="";
while read line; do
    echo $line;
    output+="$line"$'\n';
done 

GREEN=$(tput setaf 2)
RESET=$(tput sgr0)

echo "";
echo ${GREEN}"--- FINISHED---"${RESET};
echo "";

echo "$output" | rg -A 10 "(FAILURE!|COMPILATION ERROR|\[ERROR\] Failures:)";
