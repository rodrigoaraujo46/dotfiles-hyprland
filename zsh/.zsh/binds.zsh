# shellcheck shell=bash

export KEYTIMEOUT=1

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

vi-yank-clip() {
	zle .vi-yank
	print -rn -- $CUTBUFFER | wl-copy
}
zle -N vi-yank vi-yank-clip

bindkey -v

bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char

bindkey -s ^f "^uhaunt\n"
