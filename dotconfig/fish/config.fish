if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -x GPG_TTY $(tty)
fish_add_path ~/.local/bin ~/.cargo/bin
alias nvim=lvim
