# env.nu — environment setup, runs before config.nu

$env.ATUIN_HOME = $"($env.HOME)/.atuin"

# mirrors `brew shellenv`, which .zprofile used to eval
$env.HOMEBREW_PREFIX = "/opt/homebrew"
$env.HOMEBREW_CELLAR = "/opt/homebrew/Cellar"
$env.HOMEBREW_REPOSITORY = "/opt/homebrew"
$env.INFOPATH = $"/opt/homebrew/share/info:($env.INFOPATH? | default '')"

$env.PATH = (
    $env.PATH
    | split row (char esep)
    | prepend "/opt/homebrew/sbin"
    | prepend "/opt/homebrew/bin"
    | prepend $"($env.HOME)/.local/bin"
    | prepend $"($env.ATUIN_HOME)/bin"
    | prepend "/Users/justinmathew/.opencode/bin"
    | append "/Applications/Obsidian.app/Contents/MacOS"
    | uniq
)
