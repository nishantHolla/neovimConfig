-- Theme module

local theme = {}

theme.colorscheme = 'slate'

theme.set = function()
	vim.cmd('colorscheme ' .. theme.colorscheme)
end

return theme
