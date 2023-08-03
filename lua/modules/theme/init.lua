-- Theme module

local theme = {}

theme.colorscheme = 'kanagawa-dragon'

theme.set = function()
	vim.cmd('colorscheme ' .. theme.colorscheme)
	vim.cmd([[
		hi MatchParen ctermbg=black guibg=black
	]])
end

return theme
