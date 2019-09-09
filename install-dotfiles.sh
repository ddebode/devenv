curl -s https://raw.githubusercontent.com/bashdot/bashdot/master/bashdot > bashdot
sudo mv bashdot /usr/local/bin
sudo chmod a+x /usr/local/bin/bashdot
bashdot install dotfiles
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone https://github.com/jonmosco/kube-tmux ~/.tmux/kube-tmux
