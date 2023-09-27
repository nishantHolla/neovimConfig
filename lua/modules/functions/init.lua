-- Functions module

local functions = {}

functions.closeBuffer = function()
	local lsOutput = vim.api.nvim_command_output('ls')
	local count = select(2, lsOutput:gsub('\n', '\n')) + 1

	if count == 1 then
		vim.cmd('q')
	else
		vim.cmd('bd')
	end
end

functions.openTelescope = function(_pickerName)
	local theme = 'ivy'
	vim.cmd('Telescope ' .. _pickerName .. ' theme=' .. theme)
end

return functions
