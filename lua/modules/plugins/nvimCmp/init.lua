-- NvimCmp plugin

local cmp = require('cmp')

local has_words_before = function()
	unpack = unpack or table.unpack
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

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
		['<a-.>'] = cmp.mapping(function(fallback)
			if vim.fn["vsnip#available"](1) == 1 then
				feedkey("<Plug>(vsnip-expand-or-jump)", "")
			else
				fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
			end
		end, { "i", "s" }),

		['<a-,>'] = cmp.mapping(function(fallback)
			if vim.fn["vsnip#jumpable"](-1) == 1 then
				feedkey("<Plug>(vsnip-jump-prev)", "")
			else
				fallback()
			end
		end, { "i", "s" }),

	}),

	sources = cmp.config.sources(
		{
			{ name = 'nvim_lsp' },
			{ name = 'nvim_lsp_signature_help' },
			{ name = 'vsnip' },
			{ name = 'buffer' },
			{ name = 'path' }
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
