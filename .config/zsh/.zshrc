# Plugins

# Zsh syntax highligting
# ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)
#
# typeset -A ZSH_HIGHLIGHT_STYLES
# ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=blue,bold'
# ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=cyan'

# Enable colors
autoload -U colors && colors


# History in cache directory
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history


# Basic auto/tab completion 
autoload -U compinit
zstyle ':completion:*' menu select
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*' group-name ''
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.


# vi mode
bindkey -v
export KEYTIMEOUT=1

# Reverse search
bindkey '^R' history-incremental-search-backward

# Jump around line
bindkey "^A" vi-beginning-of-line
bindkey "^E" vi-end-of-line

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char


# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.


# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line


# Hooks
autoload -U add-zsh-hook
add-zsh-hook -Uz chpwd () { 
    if [ -d ".git" ]; then
        onefetch
    else
        : # this is not a git repositoryi
    fi

    [[ -d "venv" ]] && source ./venv/bin/activate
    [[ ! -d "venv" && -n "$VIRTUAL_ENV" ]] && deactivate > /dev/null
}


# Alias stuff
alias v="nvim"
alias j="joshuto"
alias o="xdg-open"
alias s="nsxiv"
alias ll="exa -abghHliS"
alias cat="bat"
alias watch="neowatch -dz"

# Plugins
# source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh  # TODO: Remove?
source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh >> /dev/null # BUG: print warning otherwise

# External stuff
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

# Run freshfetch
freshfetch
