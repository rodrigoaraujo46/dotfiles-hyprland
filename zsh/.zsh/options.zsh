# shellcheck shell=bash

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=$HOME/.zsh_history

setopt INC_APPEND_HISTORY
setopt hist_ignore_dups
setopt hist_ignore_space
