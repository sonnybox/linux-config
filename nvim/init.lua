-- Ensure a undo directory exists
local undos_dir = os.getenv('HOME') .. '/.nvim-undo'
if not vim.uv.fs_stat(undos_dir) then vim.uv.fs_mkdir(undos_dir, 493) end

-- Neovim file management
vim.opt.undodir = undos_dir
vim.opt.undofile = true
vim.opt.undolevels = 1024
vim.opt.swapfile = false

-- Ensure Lazy is installed
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.uv.fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    })
end
vim.opt.runtimepath:prepend(lazypath)

-- Leader
vim.g.mapleader = ' '

require('lazy').setup({
    spec = {
        { import = 'plugins' },
    },
    -- automatically check for plugin updates
    checker = { enabled = true },
    -- disable change detection
    change_detection = { enabled = false },
    rocks = { enabled = false },
})

require('native')
