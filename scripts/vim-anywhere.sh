#!/usr/bin/env bash
# origin script: https://github.com/cjbassi/vim-anywhere 

function usage {
    echo "Must give either 'vim', 'nvim', or 'gvim' followed by default terminal if using vim or nvim."
}

if [[ $1 == "-h" ]] || [[ $1 == "--help" ]]; then
    usage
    exit 0
fi

vim=$1
terminal=$2

if [[ $vim != "vim" ]] && [[ $vim != "nvim" ]] && [[ $vim != "gvim" ]]; then
    usage
    exit 1
elif [[ $vim != "gvim" ]] && [[ $terminal == "" ]]; then
    usage
    exit 1
fi

function setclip {
    xclip -selection c
}

function getclip {
    xclip -selection clipboard -o
}

mkdir -p /tmp/vim-anywhere
file=$(mktemp -p /tmp/vim-anywhere)

if [[ $vim == 'gvim' ]]; then
    $vim $file
else
    if [[ $terminal == 'alacritty' ]] || [[ $terminal == 'urxvt' ]]; then
        $terminal -e $vim $file
    else
        $terminal -e "$vim $file"
    fi
fi

cat $file | setclip
