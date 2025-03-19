local mini = function()
	require('mini.pairs').setup()
	require('mini.files').setup()
	require('mini.icons').setup()
	local gen_loader = require('mini.snippets').gen_loader
	require('mini.snippets').setup({
		snippets = {
			-- Load custom file with global snippets first (adjust for Windows)
			gen_loader.from_file(
				'/home/sonny/.local/share/nvim/lazy/friendly-snippets/snippets/html.json'
			),

			-- Load snippets based on current language by reading files from
			-- "snippets/" subdirectories from 'runtimepath' directories.
			gen_loader.from_lang(),
		},
	})
	MiniIcons.tweak_lsp_kind()
	require('mini.completion').setup()
	vim.keymap.set(
		'n',
		'<leader>f',
		require('mini.files').open,
		{ noremap = true, silent = true }
	)
end

return {
	'echasnovski/mini.nvim',
	config = mini,
	version = '*',
	dependencies = { 'rafamadriz/friendly-snippets' },
}
