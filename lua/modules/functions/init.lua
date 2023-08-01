
local functions = {}

functions.closeBuffer = function()
	local lsOutput = vim.api.nvim_command_output('ls')
	local count  = select(2, lsOutput:gsub('\n', '\n')) + 1

	if count == 1 then
		vim.cmd('q')
	else
		vim.cmd('bd')
	end

end


return functions
