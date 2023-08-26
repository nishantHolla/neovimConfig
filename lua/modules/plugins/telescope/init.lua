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
		find_files = {
			-- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
			find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
			cwd = os.getenv('HOME')
		},
	},

	extensions = {
	}
})


require('telescope').load_extension('fzf')
