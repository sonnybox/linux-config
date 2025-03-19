if status is-interactive
    # Commands to run in interactive sessions can go here
    pyenv init - fish | source
    fish_add_path /home/sonny/.local/bin
    set -x GGML_CUDA_ENABLE_UNIFIED_MEMORY 1
end
