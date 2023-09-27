require('aerial').setup({
	backends = { 'treesitter', 'lsp', 'markdown', 'man' },
	open_automatic = false,
	attach_mode = 'global',
	show_guides = false,
	close_automatic_events = { 'unsupported' },
	layout = {
		resize_to_content = true,
	},
})
