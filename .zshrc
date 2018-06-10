#!/bin/zsh

# ========================================
# setup vim mode
# ========================================

bindkey -v
bindkey "^W" backward-kill-word # vi-backward-kill-word
bindkey "^H" backward-delete-char # vi-backward-delete-char
bindkey "^U" backward-kill-line # vi-kill-line
bindkey "^?" backward-delete-char # vi-backward-delete-char

# ========================================
# end block
# ========================================

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/onaga/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# ========================================
# history settings
# ========================================
HISTFILE="/home/onaga/.histfile"
HISTSIZE=10000
SAVEHIST=$HISTSIZE

setopt hist_ignore_all_dups
setopt share_history

bindkey -M vicmd 'k' history-beginning-search-backward
bindkey -M vicmd 'j' history-beginning-search-forward

# ========================================
# end block
# ========================================

setopt correctall

# set prompt
export PS1=$'%{\e[01;32m%}%n@%{\e[0m%}%{\e[01;31m%}mac%{\e[0m%}:%{\e[01;34m%}%2~%{\e[0m%}$ '

export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:/opt/cuda/lib64:/opt/cuda/extras/CUPTI/lib64"
export PATH="${PATH}:/opt/cuda/bin"

alias ls='ls --color=auto'
alias grep='grep --color=auto'

# ========================================
# show vim mode and git branch
# ========================================

function precmd {
  GIT="$(git rev-parse --abbrev-ref HEAD)"
  RPROMPT="[$GIT]"
  [[ $KEYMAP = vicmd ]] && RPROMPT="[COMMAND MODE] [$GIT]"
}

function zle-line-init zle-keymap-select {
  GIT="$(git rev-parse --abbrev-ref HEAD)"
  RPROMPT="[$GIT]"
  [[ $KEYMAP = vicmd ]] && RPROMPT="[COMMAND MODE] [$GIT]"
  () { return $__prompt_status }
  zle reset-prompt
}

zle -N zle-keymap-select
zle -N zle-line-init

# ========================================
# end block
# ========================================

# decrease keytimeout
export KEYTIMEOUT=1
