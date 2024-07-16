if status is-interactive
    # Commands to run in interactive sessions can go here
    function nv
        alacritty -e nvim $argv &
    end
    function vimsudo
        sudo nvim -u ~/.bin/lib/rootvim.lua $argv
    end
    function battery
        if test "$argv" = 'time'
            acpi && date
        else
            cat /sys/class/power_supply/BAT1/capacity
        end
    end
    function cs
        # if there is one argument
        if test (count $argv) -eq 1
            cd ~/Class/*$argv*
        else
            # if there are more than one argument
            cd ~/Class/*$argv[1]*/*$argv[2]*
        end
    end
    function config
        set last_dir (pwd)
        switch $argv
            case "nvim"
                cd ~/.config/nvim/
                nvim init.lua
            case "fish"
                cd ~/.config/fish/
                nvim config.fish
            case "alacritty"
                cd ~/.config/alacritty/
                nvim alacritty.toml
            case "hypr"
                cd ~/.config/hypr/
                nvim hyprland.conf
            case "kitty"
                cd ~/.config/kitty/
                nvim kitty.conf
        end
        cd $last_dir
    end
    function uefi
        systemctl reboot --firmware-setup
    end
    function yt-mp3
        set last_dir (pwd)
        cd ~/Music
        if test (count $argv) -eq 0
            echo "Usage: yt-mp3 '<url>'"
        else
            yt-dlp -x --audio-format flac --audio-quality 0 $argv
        end
        cd $last_dir
    end
    starship init fish | source
    source ~/.py-venv/bin/activate.fish
    set -x GPG_TTY $(tty)
    fish_add_path ~/.bin
end

# bun
# set --export BUN_INSTALL "$HOME/.bun"
# set --export PATH $BUN_INSTALL/bin $PATH

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
