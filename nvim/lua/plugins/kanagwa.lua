local config = function()
    require('kanagawa').setup({
        compile = false, -- if true run :KanagawaCompile after updates to configuration
        undercurl = true, -- enable undercurls
        commentStyle = { italic = false, bold = true },
        functionStyle = { bold = true, italic = true },
        keywordStyle = { bold = true, italic = false },
        statementStyle = { bold = true, italic = true },
        typeStyle = { bold = true, italic = true },
        terminalColors = false, -- switch terminal colors to colorscheme
        dimInactive = false,
        background = { dark = 'wave', light = 'lotus' },
        -- overrides = function(colors) end,
        transparent = true,
        colors = {
            theme = {
                all = {
                    ui = {
                        bg_gutter = 'none',
                    },
                },
            },
            palette = {
                sumiInk3 = 'none',
            },
        },
        theme = 'wave',
    })
    vim.cmd.colorscheme('kanagawa')
end
return { 'rebelot/kanagawa.nvim', config = config, lazy = false }
