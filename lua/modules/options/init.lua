
local options = {}

options.list = {
	colorcolumn = "100",
	confirm = true,
	ignorecase = true,
	incsearch = true,
	number = true,
	smartindent = true,
	scrolloff = 10,
	sidescrolloff = 10,
	shiftwidth = 4,
	smartcase = true,
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
