# vl $(fd $1 | fzf --preview 'batcat --style=numbers --color=always {} || cat {}')
#!/bin/bash

# Ensure fd is installed
if ! command -v fd &> /dev/null
then
    echo "fd could not be found. Please install fd."
    exit
fi

# Ensure vl is installed
if ! command -v vl &> /dev/null
then
    echo "vl could not be found. Please install vl."
    exit
fi

# Ensure fzf is installed
if ! command -v fzf &> /dev/null
then
    echo "fzf could not be found. Please install fzf."
    exit
fi

# Ensure bat is installed or fall back to cat
if command -v bat &> /dev/null
then
    PREVIEW_CMD='batcat --style=numbers --color=always {}'
else
    PREVIEW_CMD='cat {}'
fi

# Run fd with fzf and preview
selected_file=$(fd "$1" | fzf --preview "$PREVIEW_CMD")

# If a file is selected, open it with vl
if [ -n "$selected_file" ]; then
    vl "$selected_file"
else
    echo "No file selected."
fi

