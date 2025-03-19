function config
	set last_dir (pwd)
	switch $argv
		case "nvim"
			cd ~/.config/nvim/
			nvim init.lua
		case "fish"
			cd ~/.config/fish/
			nvim config.fish
		case "hypr"
			cd ~/.config/hypr/
			nvim hyprland.conf
		case "kitty"
			cd ~/.config/kitty/
			nvim kitty.conf
	end
	cd $last_dir
end
