#!/bin/zsh

source ~/.iterm2_shell_integration.zsh

# Lines configured by zsh-newuser-install
HISTFILE="~/.history"
HISTSIZE=10000
SAVEHIST=$HISTSIZE

bindkey -v
bindkey "^W" backward-kill-word # vi-backward-kill-word
bindkey "^H" backward-delete-char # vi-backward-delete-char
bindkey "^U" backward-kill-line # vi-kill-line
bindkey "^?" backward-delete-char # vi-backward-delete-char

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
setopt hist_ignore_all_dups
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

setopt correctall

export PS1="[%n %1~]$ "

export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
alias ls='ls -G'
alias grep='grep --color=auto'
