-- Autocommands module

local autocommands = {}

local makeAutoCommand = vim.api.nvim_create_autocmd
local makeAutoGroup = vim.api.nvim_create_augroup

autocommands.groups = {
    editing = makeAutoGroup('editing', { clear = true }),
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
        callback = function()
            if vim.bo.filetype ~= 'gitcommit' then
                vim.cmd('silent! loadview')
            end
        end,
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

    {
        event = 'LspAttach',
        callback = function(ev)
            NvimConfig.keymaps.lspKeymaps(ev)
        end,
        group = autocommands.groups.editing,
        description = 'Bind lsp keymaps if lsp server is attached',
    },

    {
        event = 'FileType',
        pattern = { 'markdown', 'text', 'gitcommit' },
        command = 'setlocal spell | setlocal wrap',
        description = 'Set options for text type file types',
    },

    {
        event = 'BufWritePost',
        pattern = {
            '?*.lua',
            '?*.cpp',
            '?*.hpp',
            '?*.js',
            '?*.py',
            '?*.jsx',
            '?*.tsx',
            '?*.css',
            '?*.scss',
            '?*.html',
            '?*.astro',
            '?*.cjs',
        },
        command = 'FormatWrite',
        description = 'Format files after saving',
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
