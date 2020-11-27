#!/bin/bash
# Script which you can pipe the maven output into and it will grep the interesting stuff for you at the end!
# This script is using rip-grep
# To keep the colors in the maven output use unbuffer (package expect-dev): unbuffer mvn clean install | <this script>

output="";
while read line; do
    echo $line;
    output+="$line"$'\n';
done 

echo "";
echo -e "\e[32m--- FINISHED---  \033[0m";
echo "";

echo "$output" | rg -A 10 "(FAILURE!|COMPILATION ERROR|\[ERROR\] Failures:)";
