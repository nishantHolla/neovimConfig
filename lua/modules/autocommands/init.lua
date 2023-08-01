-- Autocommands module

local autocommands = {}

local makeAutoCommand = vim.api.nvim_create_autocmd
local makeAutoGroup = vim.api.nvim_create_augroup

autocommands.groups = {
	editing = makeAutoGroup('editing', {clear = true}),
}

autocommands.list = {
	{
		event = 'BufEnter',
		pattern = '?*',
		command = 'set formatoptions-=cro',
		group = autocommands.groups.editing,
		description = 'Stop auto commenting',
	},

	{
		event = 'BufWinLeave',
		pattern = '?*',
		command = 'silent! mkview',
		group = autocommands.groups.editing,
		description = 'Save file state befor leaving',
	},

	{
		event = 'BufWinEnter',
		pattern = '?*',
		command = 'silent! loadview',
		group = autocommands.groups.editing,
		description = 'Load file state if it exists',
	},

	{
		event = 'BufWritePre',
		pattern = '?*',
		command = [[%s/ \+$//e | %s/\n\+\%$//e]],
		group = autocommands.groups.editing,
		description = 'Remove trailing white spaces before saving',
	},
}

autocommands.set = function()
	for _, cmd in pairs(autocommands.list) do
		makeAutoCommand(cmd.event, {
			pattern = cmd.pattern,
			group = cmd.group,
			command = cmd.command,
			callback = cmd.callback,
		})
	end
end

return autocommands
