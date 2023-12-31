-- Options module

local options = {}

options.list = {
    colorcolumn = '100',
    confirm = true,
    expandtab = true,
    ignorecase = true,
    number = true,
    numberwidth = 5,
    incsearch = true,
    smartindent = true,
    scrolloff = 10,
    sidescrolloff = 10,
    signcolumn = 'yes',
    shiftwidth = 4,
    showmode = false,
    linebreak = true,
    smartcase = true,
    mouse = '',
    swapfile = false,
    tabstop = 4,
    termguicolors = true,
    undofile = true,
    wrap = false,
}

options.set = function()
    for option, value in pairs(options.list) do
        vim.opt[option] = value
    end
end

return options
