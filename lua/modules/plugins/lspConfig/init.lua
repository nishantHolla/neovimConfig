local lspConfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.cmd([[
  highlight! DiagnosticLineNrError guibg=#51202A guifg=#FF0000 gui=bold
  highlight! DiagnosticLineNrWarn guibg=#51412A guifg=#FFA500 gui=bold
  highlight! DiagnosticLineNrInfo guibg=#1E535D guifg=#00FFFF gui=bold
  highlight! DiagnosticLineNrHint guibg=#1E205D guifg=#0000FF gui=bold

  sign define DiagnosticSignError text= texthl=DiagnosticSignError linehl= numhl=DiagnosticLineNrError
  sign define DiagnosticSignWarn text= texthl=DiagnosticSignWarn linehl= numhl=DiagnosticLineNrWarn
  sign define DiagnosticSignInfo text= texthl=DiagnosticSignInfo linehl= numhl=DiagnosticLineNrInfo
  sign define DiagnosticSignHint text= texthl=DiagnosticSignHint linehl= numhl=DiagnosticLineNrHint
]])

function PrintDiagnostics(opts, bufnr, line_nr, client_id)
    bufnr = bufnr or 0
    line_nr = line_nr or (vim.api.nvim_win_get_cursor(0)[1] - 1)
    opts = opts or { ['lnum'] = line_nr }

    local line_diagnostics = vim.diagnostic.get(bufnr, opts)
    if vim.tbl_isempty(line_diagnostics) then
        return
    end

    local diagnostic_message = ''
    for i, diagnostic in ipairs(line_diagnostics) do
        diagnostic_message = diagnostic_message
            .. string.format('%d: %s', i, diagnostic.message or '')
        print(diagnostic_message)
        if i ~= #line_diagnostics then
            diagnostic_message = diagnostic_message .. '\n'
        end
    end
    vim.api.nvim_echo({ { diagnostic_message, 'Normal' } }, false, {})
end

local showFloat = true

if showFloat then
    vim.o.updatetime = 1000
    vim.cmd([[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]])
else
    vim.o.updatetime = 250
    vim.cmd([[ autocmd! CursorHold * lua PrintDiagnostics() ]])
end

vim.diagnostic.config({
    virtual_text = false,
    update_in_insert = false,
    underline = true,
    severity_sort = true,
    float = {
        focusable = true,
        style = 'minimal',
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
    },
})

lspConfig['clangd'].setup({
    capabilities = capabilities,
})

lspConfig['lua_ls'].setup({
    capabilities = capabilities,
})

lspConfig['pyright'].setup({
    capabilities = capabilities,
})

lspConfig['tsserver'].setup({
    capabilities = capabilities,
})

lspConfig['cssls'].setup({
    capabilities = capabilities,
})

lspConfig['cmake'].setup({
    capabilities = capabilities,
})

lspConfig['eslint'].setup({})
