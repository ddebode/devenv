
#!/bin/bash

sdk use java 21.0.2-open
while true; do
    NVIM_APPNAME=nvim-lazy /home/ddebode/Downloads/neovim/nvim.appimage-0.10 "$@"  # change path to real nvim binary as necessary
    if [ $? -ne 1 ]; then
        break
    fi
done
