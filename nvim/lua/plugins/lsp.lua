local masonlsp = function()
	require('mason-lspconfig').setup({
		automatic_installation = true,
		ensure_installed = {
			'lua_ls',
			'ruff',
			'basedpyright',
			'html',
		},
	})

	local lsp = require('lspconfig')
	lsp.lua_ls.setup({})
	lsp.html.setup({})
end

return {
	'williamboman/mason-lspconfig.nvim',
	config = masonlsp,
	dependencies = {
		{ 'neovim/nvim-lspconfig' },
		{
			'folke/lazydev.nvim',
			ft = 'lua',
			opts = {
				library = {
					{ path = '${3rd}/luv/library', words = { 'vim%.uv' } },
				},
			},
		},
	},
}
