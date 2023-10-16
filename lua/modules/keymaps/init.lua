-- Keymaps module

local keymaps = {}

local makeKeymap = vim.keymap.set

keymaps.leader = ','
keymaps.snr = { silent = true, noremap = true }
keymaps.nr = { silent = false, noremap = false }
keymaps.s = { slient = true, noremap = false }

keymaps.normalMode = {
    {
        groupName = 'Split movement',
        { '<a-h>', '<c-w>h', keymaps.snr, 'Move to left split' },
        { '<a-j>', '<c-w>j', keymaps.snr, 'Move to bottom split' },
        { '<a-k>', '<c-w>k', keymaps.snr, 'Move to top split' },
        { '<a-l>', '<c-w>l', keymaps.snr, 'Move to right split' },
    },

    {
        groupName = 'Buffer movement',
        { '<a-,>', ':bp<cr>', keymaps.snr, 'Move to previous buffer' },
        { '<a-.>', ':bn<cr>', keymaps.snr, 'Move to next buffer' },
    },

    {
        groupName = 'Quick actions',
        {
            '<leader>ss',
            ':w<cr>',
            keymaps.snr,
            'Write current buffer',
        },
        {
            '<leader>sa',
            ':wa<cr>',
            keymaps.snr,
            'Write all open buffers',
        },
        {
            '<leader>qq',
            ':lua NvimConfig.functions.closeBuffer()<cr>',
            keymaps.snr,
            'Close current buffer',
        },
        {
            '<leader>qa',
            ':qa<cr>',
            keymaps.snr,
            'Close all open buffers',
        },
    },

    {
        groupName = 'Deletion',
        { 'd', '"_d', keymaps.snr, 'Delete without poluting the register' },
        { 'D', '"_D', keymaps.snr, 'Delete forward without poluting the register' },
        { 'c', '"_c', keymaps.snr, 'Change without poluting the register' },
        { 'C', '"_C', keymaps.snr, 'Change forward with poluting the register' },
        { 'x', '"_x', keymaps.snr, 'Remove without poluting the register' },

        { '<leader>d', 'd', keymaps.snr, 'Delete and polute the register' },
        { '<leader>D', 'D', keymaps.snr, 'Delete forward and polute the register' },
        { '<leader>c', 'c', keymaps.snr, 'Change and polute the register' },
        { '<leader>C', 'C', keymaps.snr, 'Change forward and polute the register' },
    },

    {
        groupName = 'Searching',
        { '<esc>', ':nohl<cr>', keymaps.snr, 'Remove search highlights' },
    },

    {
        groupName = 'Nvim lf plugin',
        plugin = 'lf',
        { '<leader>;', ':Lf<cr>', keymaps.snr, 'Open file manager' },
    },

    {
        groupName = 'Toggleterm plugin',
        plugin = 'toggleTerm',
        { '<a-`>', [[:ToggleTerm<cr><c-\><c-n>i]], keymaps.snr, 'Toggle terminal' },
    },

    {
        groupName = 'Hop plugin',
        plugin = 'hop',
        { 'f', ':HopChar1CurrentLine<cr>', keymaps.snr, 'Hop in current line' },
        { '<leader>f', ':HopAnywhereMW<cr>', keymaps.snr, 'Hop anywhere' },
    },

    {
        groupName = 'Telescope plugin',
        plugin = 'telescope',
        {
            '<leader>t',
            ':lua NvimConfig.functions.openTelescope("builtin")<cr>',
            keymaps.snr,
            'Open Telescope',
        },
        {
            '<leader>b',
            ':lua NvimConfig.functions.openTelescope("buffers")<cr>',
            keymaps.snr,
            'Open Telescope',
        },
    },

    {
        groupName = 'Aerial plugin',
        plugin = 'aerial',
        { '<leader>a', ':AerialToggle<cr>', keymaps.snr, 'Toggle Aerial' },
    },
}

keymaps.insertMode = {
    {
        groupName = 'Mode movement',
        { '<leader><leader>', '<esc>', keymaps.snr, 'Move to normal mode' },
    },

    {
        groupName = 'Text movement',
        { '<a-h>', '<left>', keymaps.snr, 'Move left by one character' },
        { '<a-j>', '<down>', keymaps.snr, 'Move down by one character' },
        { '<a-k>', '<up>', keymaps.snr, 'Move right by one character' },
        { '<a-l>', '<right>', keymaps.snr, 'Move up by one character' },
    },
}

keymaps.visualMode = {
    {
        groupName = 'Deletion',
        { 'd', '"_d', keymaps.snr, 'Delete without poluting the register' },
        { 'D', '"_D', keymaps.snr, 'Delete forward without poluting the register' },
        { 'c', '"_c', keymaps.snr, 'Change without poluting the register' },
        { 'C', '"_C', keymaps.snr, 'Change forward with poluting the register' },
        { 'x', '"_x', keymaps.snr, 'Remove without poluting the register' },

        { '<leader>d', 'd', keymaps.snr, 'Delete and polute the register' },
        { '<leader>D', 'D', keymaps.snr, 'Delete forward and polute the register' },
        { '<leader>c', 'c', keymaps.snr, 'Change and polute the register' },
        { '<leader>C', 'C', keymaps.snr, 'Change forward and polute the register' },
    },
    {
        groupName = 'Searching and replacing',
        { '/', [["0y<escape>/<c-r>0]], keymaps.nr, 'Search selected text' },
        { '<leader>:s', [["0y<escape>:%s/<c-r>0/]], keymaps.nr, 'Replace selected text' },
    },
    {
        groupName = 'Text movement',
        { '<a-s>', [[:m '>+1<CR>gv=gv]], keymaps.snr, 'Move selected text down by one line' },
        { '<a-d>', [[:m '<-2<CR>gv=gv]], keymaps.snr, 'Move selected text up by one line' },
    },
}

keymaps.terminalMode = {
    {
        groupName = 'Mode movement',
        { '<leader><leader>', [[<c-\><c-n>]], keymaps.snr, 'Move to normal mode' },
    },

    {
        groupName = 'Split movement',
        { '<a-h>', [[<c-\><c-n><c-w>h]], keymaps.snr, 'Move to left split' },
        { '<a-j>', [[<c-\><c-n><c-w>j]], keymaps.snr, 'Move to bottom split' },
        { '<a-k>', [[<c-\><c-n><c-w>k]], keymaps.snr, 'Move to top split' },
        { '<a-l>', [[<c-\><c-n><c-w>l]], keymaps.snr, 'Move to right split' },
    },

    {
        groupName = 'Toggleterm plugin',
        plugin = 'toggleTerm',
        { '<a-`>', [[<c-\><c-n>:ToggleTerm<cr>]], keymaps.snr, 'Toggle terminal' },
    },
}

keymaps.lspKeymaps = function(ev)
    local opts = { buffer = ev.buf }
    makeKeymap('n', 'gD', vim.lsp.buf.declaration, opts)
    makeKeymap('n', 'gd', vim.lsp.buf.definition, opts)
    makeKeymap('n', 'K', vim.lsp.buf.hover, opts)
    makeKeymap('n', 'gi', vim.lsp.buf.implementation, opts)
    makeKeymap('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    makeKeymap('n', '<leader>lwa', vim.lsp.buf.add_workspace_folder, opts)
    makeKeymap('n', '<leader>lwr', vim.lsp.buf.remove_workspace_folder, opts)
    makeKeymap('n', '<leader>lws', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    makeKeymap('n', '<leader>ltd', vim.lsp.buf.type_definition, opts)
    makeKeymap('n', '<leader>lrn', vim.lsp.buf.rename, opts)
    makeKeymap({ 'n', 'v' }, '<leader>lca', vim.lsp.buf.code_action, opts)
    makeKeymap('n', 'gr', vim.lsp.buf.references, opts)
    makeKeymap('n', '<leader>lf', function()
        vim.lsp.buf.format({ async = true })
    end, opts)
end

keymaps.dapKeymaps = function()
    local opts = { silent = true, noremap = true }
    makeKeymap('n', '<leader>1', ':lua require("dap").toggle_breakpoint()<cr>', opts)
    makeKeymap('n', '<leader>2', ':lua require("dap").step_into()<cr>', opts)
    makeKeymap('n', '<leader>3', ':lua require("dap").continue()<cr>', opts)
    makeKeymap('n', '<leader>4', ':lua require("dap").step_over()<cr>', opts)
    makeKeymap('n', '<leader>0', ':lua require("dap").repl.open()<cr>', opts)
end

keymaps.setForMode = function(_mode, _maps)
    for _, set in pairs(_maps) do
        if set.plugin and NvimConfig.plugins.list[set.plugin].enabled == false then
            goto continue
        end

        set.groupName = nil
        set.plugin = nil

        for _, map in pairs(set) do
            makeKeymap(_mode, map[1], map[2], map[3])
        end

        ::continue::
    end

    keymaps.dapKeymaps()
end

keymaps.set = function()
    vim.g.mapleader = keymaps.leader

    keymaps.setForMode('n', keymaps.normalMode)
    keymaps.setForMode('i', keymaps.insertMode)
    keymaps.setForMode('v', keymaps.visualMode)
    keymaps.setForMode('t', keymaps.terminalMode)
end

return keymaps
