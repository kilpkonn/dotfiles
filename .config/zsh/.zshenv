#!/usr/bin/zsh

# Default programs
export EDITOR="nvim"

# cuz java can't handle no desktop environments
export _JAVA_AWT_WM_NONREPARENTING=1

# ~/ Clean up
export ZDOTDIR="$HOME/.config/zsh"

# Path
# export PATH="$PATH:~/.ghcup/bin"
export PATH="$HOME/.cabal/bin:$HOME/.cargo/bin:$PATH:$HOME/.local/bin"

