fish_add_path ~/.cargo/bin

set -U fish_greeting # disable fish greeting
set -U fish_key_bindings fish_vi_key_bindings

set -Ux EDITOR nvim

alias v="nvim"
alias j="joshuto"
alias o="xdg-open"
alias s="nsxiv"
alias ll="eza -abghHliS"
alias cat="bat"
alias watch="neowatch -dz"

starship init fish | source
atuin init fish --disable-up-arrow | source
zoxide init fish | source

freshfetch
