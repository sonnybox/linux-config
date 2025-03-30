local mini = function()
    require('mini.pairs').setup()
    require('mini.icons').setup()
    require('mini.files').setup()
    require('mini.surround').setup()
    require('mini.jump').setup()
    require('mini.pick').setup()
    require('mini.cursorword').setup()
    require('mini.git').setup()
    require('mini.diff').setup()
    require('mini.statusline').setup()
    require('mini.tabline').setup()
    require('mini.clue').setup({
        triggers = {
            { mode = 'n', keys = '<leader>' },
        },
    })

    local hipatterns = require('mini.hipatterns')
    hipatterns.setup({
        highlighters = {
            hex_color = hipatterns.gen_highlighter.hex_color(),
        },
    })

    local indentscope = require('mini.indentscope')
    indentscope.setup({
        symbol = '│',
        draw = { animation = indentscope.gen_animation.none() },
    })

    local noti = require('mini.notify')
    noti.setup()
    vim.notify = noti.make_notify({
        ERROR = { duration = 5000 },
        WARN = { duration = 4000 },
        INFO = { duration = 3000 },
    })

    -- require('mini.ai').setup()
    vim.keymap.set(
        'n',
        '<leader>e',
        require('mini.files').open,
        { noremap = true, silent = true }
    )
    vim.keymap.set(
        'n',
        '<leader>ff',
        function() MiniPick.builtin.files() end,
        { noremap = true, silent = true }
    )
end

return {
    'echasnovski/mini.nvim',
    config = mini,
    version = false,
}
