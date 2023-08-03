-- NvimCmp plugin

local cmp = require('cmp')

cmp.setup({
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
		end,
	},

	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<a-j>'] = cmp.mapping.select_next_item(),
		['<a-k>'] = cmp.mapping.select_prev_item(),
		['<a-e>'] = cmp.mapping.abort(),
		['<a-;>'] = cmp.mapping.confirm({ select = true }),
	}),

	sources = cmp.config.sources(
		{
			{name = 'nvim_lsp'},
			{name = 'nvim_lsp_signature_help'},
			{name = 'vsnip'},
			{name = 'buffer'},
			{name = 'path'}
		},
		{}
	)
})

cmp.setup.cmdline({ '/', '?' }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = 'buffer' }
	}
})

cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'path' }
	}, {
		{ name = 'cmdline' }
	})
})

require('modules.plugins.mason')
require('modules.plugins.lspConfig')
