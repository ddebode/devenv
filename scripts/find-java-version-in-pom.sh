#!/bin/bash
# This scripts checks the java version defined in the pom file in the current folder and then switches to correct java version
# scripts needs ripgrep
# Put this in your zshrc or bashrc
# # Ls after every cd and check java version
# function cd {
#    builtin cd "$@" && ls -F && source ~/path_to_script/find-java-version-in-pom.sh
# }
#source ~/path_to_srcipt/find-java-version-in-pom.sh

version=$(rg -o '<java.version>.*</java.version' pom.xml | rg -o '[\d]+\.?\d?') 2> /dev/null

if [ "$version" = "12" ]; then
    echo "Switch to java 12"
    export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-12.jdk/Contents/Home
fi

if [ "$version" = "11" ]; then
    echo "Switch to java 11"
    export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-11.jdk/Contents/Home
fi

if [ "$version" = "1.8" ]; then
    echo "Switch to java 8"
    export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home
fi

