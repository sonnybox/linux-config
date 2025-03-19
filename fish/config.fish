if status is-interactive
	fish_add_path /home/sonny/.local/bin
	set -x GGML_CUDA_ENABLE_UNIFIED_MEMORY 1
	set -x GPG_TTY $(tty)
end
pyenv init - fish | source
