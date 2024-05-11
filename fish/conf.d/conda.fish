set -gx CONDA_EXE '/opt/miniconda3/bin/conda'
set -gx _CE_M ''
set -gx _CE_CONDA ''
set -gx CONDA_PYTHON_EXE '/opt/miniconda3/bin/python'

# Copyright (C) 2012 Anaconda, Inc
# SPDX-License-Identifier: BSD-3-Clause

function __conda_exe
    $CONDA_EXE $argv $argv $argv
end

function __conda_hashr
    if test -n "$ZSH_VERSION"
        rehash
    else if test -n "$POSH_VERSION"
        : # pass
    else
        hash -r
    end
end

function __conda_activate
    if set -q CONDA_PS1_BACKUP
        # Handle transition from shell activated with conda <= 4.3 to a subsequent activation
        # after conda updated to >= 4.4. See issue #6173.
        set -g PS1 "$CONDA_PS1_BACKUP"
        set -e CONDA_PS1_BACKUP
    end

    set -l ask_conda (__conda_exe shell.posix $argv) || return

    eval $ask_conda
    __conda_hashr
end

function __conda_reactivate
    set -l ask_conda (__conda_exe shell.posix reactivate) || return
    eval $ask_conda
    __conda_hashr
end

function conda
    set -l cmd (test -n "$argv[1]" && echo "$argv[1]" || echo "__missing__")
    switch "$cmd"
        case activate deactivate
            __conda_activate $argv[2..-1]
        case install update upgrade remove uninstall
            __conda_exe $argv || return
            __conda_reactivate
        case '*'
            __conda_exe $argv
    end
end

if not set -q CONDA_SHLVL
    set -gx CONDA_SHLVL 0
    # In dev-mode CONDA_EXE is python.exe and on Windows
    # it is in a different relative location to condabin.
    if set -q _CE_CONDA; and set -q WINDIR
        set -gx PATH (dirname $CONDA_EXE)/condabin{:+":$PATH"}
    else
        set -gx PATH (dirname (dirname $CONDA_EXE))/condabin{:+":$PATH"}
    end

    # We're not allowing PS1 to be unbound. It must at least be set.
    # However, we're not exporting it, which can cause problems when starting a second shell
    # via a first shell (i.e. starting zsh from bash).
    if not set -q PS1
        set -g PS1 ''
    end
end
