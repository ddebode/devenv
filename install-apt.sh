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
sudo apt install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# ZSH_THEME="bira"

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
