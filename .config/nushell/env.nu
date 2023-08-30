$env.EDITOR = "nvim"

$env.config = {
    show_banner: false
}

# Cuz java can't handle no desktop environments
$env._JAVA_AWT_WM_NONREPARENTING = 1

$env.PATH = ($env.PATH | split row (char esep) | append $"($env.HOME)/.local/bin" )
$env.PATH = ($env.PATH | split row (char esep) | append $"($env.HOME)/.cargo/bin" )

# Hacky stuff
mkdir ~/.cache/nushell
zoxide init nushell | save -f ~/.cache/nushell/zoxide.nu
starship init nu | save -f ~/.cache/nushell/starship.nu
atuin init nu | save -f ~/.cache/nushell/atuin.nu
