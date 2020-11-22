#!/bin/bash

output="";
while read line; do
    echo $line;
    output+="$line"$'\n';
done 

echo "";
echo -e "\e[32m--- FINISHED---  \033[0m";
echo "";

echo "$output" | rg -A 10 "(FAILURE!|COMPILATION ERROR|BUILD SUCCES)";
