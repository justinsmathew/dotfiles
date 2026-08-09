# config.nu — interactive shell setup, runs after env.nu

$env.config.show_banner = false

$env.STARSHIP_SHELL = "nu"
mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")

source ~/.zoxide.nu
source ~/.atuin.nu
