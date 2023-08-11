-- lsp config plugin

local lspConfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

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
