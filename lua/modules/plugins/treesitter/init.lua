require('nvim-treesitter.configs').setup({
    ensure_installed = {
        'astro',
        'c',
        'cpp',
        'python',
        'javascript',
        'lua',
        'html',
        'css',
        'vim',
        'vimdoc',
        'gitcommit',
        'bash',
        'cmake',
        'make',
        'markdown',
        'markdown_inline',
        'ruby',
        'typescript',
    },

    highlight = {
        enable = true,
    },
})
