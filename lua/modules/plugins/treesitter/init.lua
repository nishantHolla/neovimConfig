-- treesitter plugin

require('nvim-treesitter.configs').setup({
	ensure_installed = {
		'c',
		'cpp',
		'python',
		'javascript',
		'lua',
		'html',
		'css',
		'vim',
		'vimdoc',
		'gitcommit',
		'bash',
		'cmake',
		'make',
		'markdown',
		'markdown_inline',
		'ruby'
	},

	highlight = {
		enable = true
	}
})
