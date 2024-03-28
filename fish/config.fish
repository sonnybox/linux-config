if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -x GPG_TTY $(tty)
fish_add_path ~/.cargo/bin
starship init fish | source

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
