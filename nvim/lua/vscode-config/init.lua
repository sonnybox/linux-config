local vscode = require('vscode')
vim.notify = vscode.notify
vim.api.nvim_create_autocmd('BufWrite', {
    pattern = '*.py',
    callback = function()
        vscode.call('ruff.executeOrganizeImports')
        print('Ruff imports organized on save')
    end,
})
