local mason = function()
    ---@diagnostic disable-next-line: missing-fields
    require('mason').setup({
        ui = {
            icons = {
                package_installed = '',
                package_pending = '',
                package_uninstalled = '',
            },
        },
    })
end

local masontools = function()
    require('mason-tool-installer').setup({
        ensure_installed = {
            'stylua',
        },
    })
end

local nonels = function()
    local null_ls = require('null-ls')
    local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
    null_ls.setup({
        sources = {
            null_ls.builtins.formatting.stylua,
            require('none-ls.formatting.ruff').with({
                extra_args = { '--extend-select', 'I' },
            }),
        },
        on_attach = function(client, bufnr)
            if client.supports_method('textDocument/formatting') then
                vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                vim.api.nvim_create_autocmd('BufWritePre', {
                    group = augroup,
                    buffer = bufnr,
                    callback = function() vim.lsp.buf.format({ async = false }) end,
                })
            end
        end,
    })
end

return {
    {
        'nvimtools/none-ls.nvim',
        config = nonels,
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvimtools/none-ls-extras.nvim',
        },
    },
    { 'williamboman/mason.nvim', config = mason },
    { 'WhoIsSethDaniel/mason-tool-installer.nvim', config = masontools },
}
