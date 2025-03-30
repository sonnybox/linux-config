vim.g.mapleader = ' ' -- set the leader key as space

vim.opt.termguicolors = true -- enable true color support
-- vim.opt.mouse = '' -- disable mouse
vim.opt.scrolloff = 5 -- add a scroll offset
vim.opt.number = true -- enable numbered lines
vim.opt.hlsearch = false -- disable highlight stuck on after search
vim.opt.cursorline = true -- enable cursor line highlighting
vim.opt.cursorlineopt = 'both' -- cursor line options
vim.opt.showmode = false -- hide mode if you are using lualine

local indent = 4 -- the number of characters for indenting
vim.opt.shiftwidth = indent -- number of spaces for indenting
vim.opt.tabstop = indent -- number of spaces tab counts for
vim.opt.softtabstop = indent -- number of spaces during editing operations
vim.opt.expandtab = true -- converts tab to spaces
vim.opt.smartindent = true -- do smart indenting on a new line

-- toggle wrap (line)
local toggle_wrap = function() vim.o.wrap = not vim.o.wrap end
vim.keymap.set('n', '<leader>w', toggle_wrap, { desc = '[w]rap' })

-- move cursor insert mode with alt
vim.api.nvim_set_keymap('i', '<M-h>', '<Left>', { noremap = true })
vim.api.nvim_set_keymap('i', '<M-j>', '<Down>', { noremap = true })
vim.api.nvim_set_keymap('i', '<M-k>', '<Up>', { noremap = true })
vim.api.nvim_set_keymap('i', '<M-l>', '<Right>', { noremap = true })

-- move windows with ctrl + arrow keys
vim.keymap.set(
    'n',
    '<C-left>',
    '<C-w>h',
    { desc = 'Move focus to the left window' }
)
vim.keymap.set(
    'n',
    '<C-right>',
    '<C-w>l',
    { desc = 'Move focus to the right window' }
)
vim.keymap.set(
    'n',
    '<C-down>',
    '<C-w>j',
    { desc = 'Move focus to the lower window' }
)
vim.keymap.set(
    'n',
    '<C-up>',
    '<C-w>k',
    { desc = 'Move focus to the upper window' }
)
