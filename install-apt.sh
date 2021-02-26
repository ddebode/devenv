sudo apt install gawk
sudo apt install silversearcher-ag
sudo apt install vim-gtk
sudo apt install tldr
sudo add-apt-repository ppa:lazygit-team/release
sudo apt-get update
sudo apt-get install lazygit
sudo apt install rofi
sudo add-apt-repository ppa:mmstick76/alacritty
sudo apt install alacritty  
sudo apt install wmctrl
sudo apt install virtualbox
sudo apt install vifm
sudo apt install zsh
sudo apt-get install zsh-antigen
sudo apt install tmux
sudo apt install curl
sudo apt install nodejs
sudo apt-get install npm --no-install-recommends

# ZSH_THEME="bira"

# source /usr/local/Cellar/antigen/2.2.3/share/antigen/antigen.zsh

# # Load the oh-my-zsh's library.
# antigen use oh-my-zsh

# # Bundles from the default repo (robbyrussell's oh-my-zsh).
# antigen bundle command-not-found

# # Load bundles from external repos.
# antigen bundle zsh-users/zsh-completions
# antigen bundle zsh-users/zsh-autosuggestions
# antigen bundle zsh-users/zsh-syntax-highlighting

# # Load the theme.
# # antigen theme bira
# # antigen theme romkatv/powerlevel10k

# # Workaround to reload config without issues: https://github.com/zsh-users/antigen/issues/675
# THEME=romkatv/powerlevel10k 
# antigen list | grep $THEME; if [ $? -ne 0 ]; then antigen theme $THEME; fi

# # Tell Antigen that you're done.
# antigen apply

# plugins=(git zsh-autosuggestions kubectl)
# # Lf
# lfcd () {
#     tmp="$(mktemp)"
#     lf -last-dir-path="$tmp" "$@"
#     if [ -f "$tmp" ]; then
#         dir="$(cat "$tmp")"
#         rm -f "$tmp"
#         if [ -d "$dir" ]; then
#             if [ "$dir" != "$(pwd)" ]; then
#                 cd "$dir"
#             fi
#         fi
#     fi
# }

# bindkey -s '^o' 'lfcd\n'

# # fkill - kill process
# fkill() {
#   local pid
#   pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')

#   if [ "x$pid" != "x" ]
#   then
#     echo $pid | xargs kill -${1:-9}
#   fi
# }

# # Ls after every cd
# function cd {
#    builtin cd "$@" && ls -F
# }

# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
