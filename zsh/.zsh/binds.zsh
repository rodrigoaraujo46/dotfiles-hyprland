# shellcheck shell=bash

function zle-select-cursor {
	echo -ne '\e[6 q'
	if [[ ${KEYMAP} == vicmd ]]; then
		echo -ne '\e[2 q'
	fi
}
zle -N zle-select-cursor

function zle-line-init {
	echo -ne '\e[6 q'
}
zle -N zle-line-init

export KEYTIMEOUT=1
bindkey -v

bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char

bindkey -s ^f "^uhaunt\n"
