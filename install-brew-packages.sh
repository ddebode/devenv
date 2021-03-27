#!/bin/sh

brew install --cask spectacle
brew install --cask alfred
# brew install --cask iterm2
brew install vifm
brew install tmux # tmux attach -t base || tmux new -s base
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
brew install node
brew install antigen
brew install neovim
brew install tldr
brew install lazygit
brew install the_silver_searcher
brew install lsd
brew install fd
brew install rm-improved

# Java
brew tap adoptopenjdk/openjdk
brew install --cask adoptopenjdk8
brew install --cask adoptopenjdk11
brew install --cask adoptopenjdk12
brew install maven
# Add to zshrc
# alias j12="export JAVA_HOME=`/usr/libexec/java_home -v 12`"
# alias j11="export JAVA_HOME=`/usr/libexec/java_home -v 11`"
# alias j8="export JAVA_HOME=`/usr/libexec/java_home -v 1.8`"
brew install --cask jetbrains-toolbox
# create shell script in: /usr/local/bin/idea
##!/bin/sh

#open -na "/Users/ddebode/Applications/JetBrains Toolbox/IntelliJ IDEA Community Edition.app" --args "$@"
