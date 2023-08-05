-- Telescope plugin

require('telescope').setup({
	defaults = {
		mappings = {
			i = {
				['<a-j>'] = 'move_selection_next',
				['<a-k>'] = 'move_selection_previous',
				['<a-l>'] = 'select_default',
				['<a-h>'] = 'select_horizontal',
				['<a-v>'] = 'select_vertical',
				['<a-space>'] = 'toggle_selection',
				['<a-q>'] = 'close',
			}
		}
	},

	pickers = {
	},

	extensions = {
	}
})


require('telescope').load_extension('fzf')
