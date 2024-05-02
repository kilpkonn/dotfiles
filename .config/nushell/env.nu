$env.EDITOR = "nvim"

$env.config = {
    show_banner: false
    render_right_prompt_on_last_line: false
}

# Cuz java can't handle no desktop environments
$env._JAVA_AWT_WM_NONREPARENTING = 1

$env.PATH = ($env.PATH | split row (char esep) | append $"($env.HOME)/.local/bin" )
$env.PATH = ($env.PATH | split row (char esep) | append $"($env.HOME)/.cargo/bin" )

$env.PROMPT_INDICATOR = ""
$env.PROMPT_INDICATOR_VI_INSERT = ""
$env.PROMPT_INDICATOR_VI_NORMAL = "〉"
$env.PROMPT_MULTILINE_INDICATOR = "::: "

# Hacky stuff
mkdir ~/.cache/nushell
zoxide init nushell | save -f ~/.cache/nushell/zoxide.nu
starship init nu | save -f ~/.cache/nushell/starship.nu
atuin init nu --disable-up-arrow | save -f ~/.cache/nushell/atuin.nu
