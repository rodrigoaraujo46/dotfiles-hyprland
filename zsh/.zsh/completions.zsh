# shellcheck shell=bash

fpath=($HOME/.zsh/completions $fpath)

zstyle ':completion:*' menu select
autoload -U compinit && compinit
zmodload zsh/complist
_comp_options+=(globdots)
