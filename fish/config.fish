if status is-interactive
	set -x GGML_CUDA_ENABLE_UNIFIED_MEMORY 1
	set -x GPG_TTY $(tty)
	alias nvidia-smi "watch -n 1 nvidia-smi"
	alias hp-server 10.0.0.74

end
fish_add_path /home/sonny/.local/bin
fish_add_path /home/sonny/.config/bin
fish_add_path /home/sonny/git/llama.cpp/build/bin
pyenv init - fish | source
