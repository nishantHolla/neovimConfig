-- Theme module

local theme = {}

theme.colorscheme = 'duskfox'

theme.set = function()
    vim.cmd('colorscheme ' .. theme.colorscheme)
    vim.cmd([[
		hi MatchParen ctermbg=black guibg=black
		hi LineNr guibg=#00000000
		hi SignColumn guibg=#00000000
		hi IndentBlankLineSpaceChar guifg=#444444
	]])
end

-- Customization for Pmenu
vim.api.nvim_set_hl(0, 'Pmenu', { fg = '#C5CDD9', bg = '#dc143c' })

vim.api.nvim_set_hl(
    0,
    'CmpItemAbbrDeprecated',
    { fg = '#7E8294', bg = 'NONE', strikethrough = true }
)
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatch', { fg = 'NONE', bold = true })
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatchFuzzy', { fg = 'NONE', bold = true })
vim.api.nvim_set_hl(0, 'CmpItemMenu', { fg = 'NONE', italic = true })

vim.api.nvim_set_hl(0, 'CmpItemKindField', { fg = '#B5585F' })
vim.api.nvim_set_hl(0, 'CmpItemKindProperty', { fg = '#B5585F' })
vim.api.nvim_set_hl(0, 'CmpItemKindEvent', { fg = '#B5585F' })

vim.api.nvim_set_hl(0, 'CmpItemKindText', { fg = '#9FBD73' })
vim.api.nvim_set_hl(0, 'CmpItemKindEnum', { fg = '#9FBD73' })
vim.api.nvim_set_hl(0, 'CmpItemKindKeyword', { fg = '#9FBD73' })

vim.api.nvim_set_hl(0, 'CmpItemKindConstant', { fg = '#D4BB6C' })
vim.api.nvim_set_hl(0, 'CmpItemKindConstructor', { fg = '#D4BB6C' })
vim.api.nvim_set_hl(0, 'CmpItemKindReference', { fg = '#D4BB6C' })

vim.api.nvim_set_hl(0, 'CmpItemKindFunction', { fg = '#A377BF' })
vim.api.nvim_set_hl(0, 'CmpItemKindStruct', { fg = '#A377BF' })
vim.api.nvim_set_hl(0, 'CmpItemKindClass', { fg = '#A377BF' })
vim.api.nvim_set_hl(0, 'CmpItemKindModule', { fg = '#A377BF' })
vim.api.nvim_set_hl(0, 'CmpItemKindOperator', { fg = '#A377BF' })

vim.api.nvim_set_hl(0, 'CmpItemKindVariable', { fg = '#7E8294' })
vim.api.nvim_set_hl(0, 'CmpItemKindFile', { fg = '#7E8294' })

vim.api.nvim_set_hl(0, 'CmpItemKindUnit', { fg = '#D4A959' })
vim.api.nvim_set_hl(0, 'CmpItemKindSnippet', { fg = '#D4A959' })
vim.api.nvim_set_hl(0, 'CmpItemKindFolder', { fg = '#D4A959' })

vim.api.nvim_set_hl(0, 'CmpItemKindMethod', { fg = '#6C8ED4' })
vim.api.nvim_set_hl(0, 'CmpItemKindValue', { fg = '#6C8ED4' })
vim.api.nvim_set_hl(0, 'CmpItemKindEnumMember', { fg = '#6C8ED4' })

vim.api.nvim_set_hl(0, 'CmpItemKindInterface', { fg = '#58B5A8' })
vim.api.nvim_set_hl(0, 'CmpItemKindColor', { fg = '#58B5A8' })
vim.api.nvim_set_hl(0, 'CmpItemKindTypeParameter', { fg = '#58B5A8' })

return theme
