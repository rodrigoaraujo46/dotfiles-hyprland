$env.config.buffer_editor = 'nvim'
$env.config.edit_mode = 'vi'
$env.config.show_banner = false

# EDITOR / VISUAL
$env.EDITOR = 'nvim'
$env.VISUAL = 'nvim'

$env.PATH ++= [($'($env.HOME)/.local/bin')]

#ALIASES
alias grep = grep --color=auto
alias vi = nvim
alias vim = nvim
alias aura = sudo

#STARSHIP
mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")

#FZF
#export FZF_COMPLETION_TRIGGER="**"
#source <(fzf --nu) THIS IS NOT CORRENTLY AVAILABLE FROM FZF

#GO
$env.GOPATH = $env.HOME + '/.go'
$env.PATH ++= [$'($env.GOPATH)/bin']

$env.config.keybindings ++= [{
    name: completion_menu
    modifier: control
    keycode: char_f
    mode: [emacs, vi_normal, vi_insert]
    event: { send: executehostcommand cmd: tmux-sessionizer}
}]

source $"($nu.cache-dir)/carapace.nu"
