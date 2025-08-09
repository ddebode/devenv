#!/bin/sh

# apt
sudo apt install transmission -y
sudo apt install rofi -y

brew install fzf
brew install vifm
brew install tmux # tmux attach -t base || tmux new -s base
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
brew install antigen
brew install tldr
brew install lazygit
brew install the_silver_searcher
brew install lsd
brew install fd
brew install rm-improved
brew install ripgrep
brew install jq
brew install bash # some tmux plugins won't work without this
brew install --cask font-jetbrains-mono-nerd-font
brew install --cask font-fira-code-nerd-font

# nodejs
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

#brew install --cask kitty

# neovim
brew install neovim

# Java
brew install maven

