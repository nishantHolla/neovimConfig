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

functions.toggleTerm = function(_number)
    vim.cmd(tostring(_number) .. 'ToggleTerm')
    if string.starts(vim.api.nvim_buf_get_name(0), 'term:') then
        vim.cmd('norm! i')
    end
end

return functions
