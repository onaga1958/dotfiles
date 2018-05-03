# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=$HISTFILE
bindkey -v
bindkey "^W" backward-kill-word # vi-backward-kill-word
bindkey "^H" backward-delete-char # vi-backward-delete-char
bindkey "^U" backward-kill-line # vi-kill-line
bindkey "^?" backward-delete-char # vi-backward-delete-char

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/onaga/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
setopt hist_ignore_all_dups
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

setopt correctall

export PS1="[%n %1~]$ "

export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:/opt/cuda/lib64:/opt/cuda/extras/CUPTI/lib64"
export PATH="${PATH}:/opt/cuda/bin"

alias ls='ls --color=auto'
alias grep='grep --color=auto'
