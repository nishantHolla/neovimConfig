-- indentlines plugin

require('indent_blankline').setup({
	use_treesitter = true,
	show_trailing_blankline_indent = false,
	enabled = NvimConfig.plugins.list['indentLines'].enabled
})
