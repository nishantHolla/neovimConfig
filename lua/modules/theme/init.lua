-- Theme module

local theme = {}

theme.colorscheme = 'nightfox'

theme.set = function()
    vim.cmd('colorscheme ' .. theme.colorscheme)
    vim.cmd([[
		hi MatchParen ctermbg=black guibg=black
		hi LineNr guibg=#00000000
		hi SignColumn guibg=#00000000
	]])
end

return theme
