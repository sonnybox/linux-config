if status is-interactive
    # Commands to run in interactive sessions can go here
    function nv
        alacritty -e nvim $argv &
    end
    function vimsudo
        sudo nvim -u ~/.bin/rootvim.lua $argv
    end
    starship init fish | source
end

set -x GPG_TTY $(tty)
fish_add_path ~/.bin

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# if test -f /home/sonny/.miniconda3/bin/conda
#     eval /home/sonny/.miniconda3/bin/conda "shell.fish" "hook" $argv | source
# else
#     if test -f "/home/sonny/.miniconda3/etc/fish/conf.d/conda.fish"
#         . "/home/sonny/.miniconda3/etc/fish/conf.d/conda.fish"
#     else
#         set -x PATH "/home/sonny/.miniconda3/bin" $PATH
#     end
# end
# <<< conda initialize <<<
