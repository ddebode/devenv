# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# # Bundles from the default repo (robbyrussell's oh-my-zsh).
# antigen bundle git
# antigen bundle heroku
# antigen bundle pip
# antigen bundle lein
antigen bundle command-not-found
antigen bundle zsh-users/zsh-autosuggestions
antigen theme romkatv/powerlevel10k
# # Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
# workaround for https://github.com/zsh-users/antigen/issues/675
# THEME=bira
# antigen list | grep $THEME; if [ $? -ne 0 ]; then antigen theme $THEME; fi

# Tell Antigen that you're done.
antigen apply

# nvm
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# [ -z "$TMUX"  ] && { tmux attach || exec tmux new-session && exit;}

alias d="cd ~/development"
alias fd=fdfind
alias fdi="source ~/development/devenv-dennisb/scripts/fd-vi.sh"
alias fdc="source ~/development/devenv-dennisb/scripts/fd-cd.sh"
alias ls="lsd --blocks  user,group,size,date,name --group-dirs first -la"
alias mg="~/development/devenv-dennisb/scripts/grep-maven-output.sh"
alias mvnc="mvn clean install"
alias nv=nvim
alias oa="firefox http://localhost:4200"
alias og="~/development/devenv-dennisb/scripts/open-git-repo-url.sh"
alias ol="firefox http://localhost:8080"
alias ols="firefox http://localhost:8080/swagger-ui.html"
alias reload="exec zsh"
alias vifm="~/.config/vifm/scripts/vifmrun"
alias vimr="vi -S ~/.vim/session.vim"
alias vi="nvim"
alias w="cd ~/development"


# Ls after every cd
cd() { builtin cd "$@" && lsd --blocks  user,group,size,date,name --group-dirs first -la; }

export BROWSER='/usr/bin/firefox'

# Path
export PATH=/home/ddebode/.cargo/env:~/.config/vifm/scripts:$PATH

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/ddebode/.sdkman"
[[ -s "/home/ddebode/.sdkman/bin/sdkman-init.sh" ]] && source "/home/ddebode/.sdkman/bin/sdkman-init.sh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

eval $(thefuck --alias)
