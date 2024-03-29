#!/bin/zsh

source /Users/onaga/.iterm2_shell_integration.zsh

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

HISTFILE="/Users/onaga/.history"
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

export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
alias ls='ls -G'
alias grep='grep --color=auto'
alias ya="~/arcadia/ya"
alias __="nvim __main__.py"
alias arc_remount='cd && arc unmount arcadia && arc mount -m arcadia/ -S store/ && echo "remount succeeded" && cd -'

function swap()
{
    local TMPFILE=tmp.$$
    mv "$1" $TMPFILE && mv "$2" "$1" && mv $TMPFILE "$2"
}

# ========================================
# show vim mode and git branch
# ========================================

function precmd {
  GIT="$(git rev-parse --abbrev-ref HEAD 2> /dev/null)"
  RPROMPT="[$GIT]"
  [[ $KEYMAP = vicmd ]] && RPROMPT="[COMMAND MODE] [$GIT]"
}

function zle-line-init zle-keymap-select {
  GIT="$(git rev-parse --abbrev-ref HEAD 2> /dev/null)"
  DATE="$(date +%H:%M:%S)"
  RPROMPT="[$GIT] [$DATE]"
  [[ $KEYMAP = vicmd ]] && RPROMPT="[COMMAND MODE] [$GIT] [$DATE]"
  () { return $__prompt_status }
  zle reset-prompt
}

function zle-line-finish {
  GIT="$(git rev-parse --abbrev-ref HEAD 2> /dev/null)"
  DATE="$(date +%H:%M:%S)"
  RPROMPT="[$GIT] [$DATE]"
  () { return $__prompt_status }
  zle reset-prompt
}

zle -N zle-keymap-select
zle -N zle-line-init
zle -N zle-line-finish

# ========================================
# end block
# ========================================

# decrease keytimeout
export KEYTIMEOUT=1

export PATH="$PATH:/usr/local/bin:/usr/local/munki"
export PATH=/opt/homebrew/bin:$PATH

# add dirs with python binaries to PATH
export PATH="$PATH:/Users/onaga/Library/Python/2.7/bin/:/Users/onaga/Library/Python/3.8/bin/"
export PATH="$PATH:/Library/Tex/texbin/"
