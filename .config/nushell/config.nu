# Aliases
alias grep = grep --color=auto
alias vi = nvim
alias vim = nvim
alias aura = sudo

def clear [] {
    ^clear
    fastfetch
}

# Keybindings
$env.config.keybindings ++= [
    {
        name: completion_menu
        modifier: control
        keycode: char_f
        mode: [emacs, vi_normal, vi_insert]
        event: { send: executehostcommand cmd: tmux-sessionizer}
    },
    {
        name: change_dir_with_fzf
        modifier: CONTROL
        keycode: Char_t
        mode: [emacs, vi_normal, vi_insert]
        event: {
            send: executehostcommand,
            cmd: "cd (ls ~/** | where type == dir | each { |row| $row.name} | str join (char nl) | fzf | decode utf-8 | str trim)"
        }
    },
    {
        name: clear
        modifier: CONTROL
        keycode: Char_l
        mode: [emacs, vi_normal, vi_insert]
        event: {
            send: executehostcommand,
            cmd: "clear"
        }
    }
]


# Carapace autocomplete
mkdir $"($nu.cache-dir)"
carapace _carapace nushell | save --force $"($nu.cache-dir)/carapace.nu"
source $"($nu.cache-dir)/carapace.nu"

# Starship
mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")

# Optional commands
fastfetch
