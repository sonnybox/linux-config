vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.relativenumber = false
vim.opt.wrap = false

lvim.plugins = {
    "rebelot/kanagawa.nvim",
    config = function ()
        lvim.colorscheme = "kanagawa-dragon"
    end
}

lvim.builtin.lualine.options.theme = "auto"
lvim.builtin.treesitter.indent.disable = {}
