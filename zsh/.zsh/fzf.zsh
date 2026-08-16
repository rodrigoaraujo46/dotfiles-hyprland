# shellcheck shell=bash

fzf_preview() {
	if [ -d "$1" ]; then
		lS "$1"
	elif [ -f "$1" ]; then
		bat --color=always --style=numbers "$1"
	else
		echo "$1" | bat --color=always --style=plain -l txt
	fi
}

export FZF_CTRL_R_OPTS="--no-preview"
export FZF_DEFAULT_OPTS="
	--color=fg:#908caa,bg:-1,hl:#ea9a97
	--color=fg+:#e0def4,bg+:#232136,hl+:#ea9a97
	--color=border:#44415a,header:#3e8fb0,gutter:#232136
	--color=spinner:#f6c177,info:#9ccfd8
	--color=pointer:#c4a7e7,marker:#eb6f92,prompt:#908caa
	--height 50% --preview-window=right:50%
	--preview '$(typeset -f fzf_preview); fzf_preview {}'
	"

unfunction fzf_preview

fzf-joint-history-widget() {
	local selected

	selected=$(cat "${HISTFILE:-$HOME/.zsh_history}" | cut -d';' -f2- | awk '
        {
            line[NR] = $0
            last[$0] = NR
        }
        END {
            for (i = 1; i <= NR; i++) {
                if (last[line[i]] == i) {
                    print line[i]
                }
            }
        }
    ' | fzf --no-preview --tac --no-sort --query="$LBUFFER")

	if [[ -n $selected ]]; then
		LBUFFER="${selected}"
	fi
	zle redisplay
}
zle -N fzf-joint-history-widget
#CTRL+SHIT+R
bindkey '^[[114;6u' fzf-joint-history-widget

source <(fzf --zsh)
