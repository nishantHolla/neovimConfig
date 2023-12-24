-- This option is set by options module also, but this plugin requires the option to be set
-- before initializing
vim.opt.termguicolors = true

require('colorizer').setup({
    filetypes = {
        '*', -- Highlight all files, but customize some others.
        cmp_docs = { always_update = true, mode = 'background' },
    },
    user_default_options = {
        RGB = true,
        RRGGBB = true,
        names = true,
        RRGGBBAA = true,
        rgb_fn = true,
        hsl_fn = true,
        css = true,
        css_fn = true,
        sass = { enable = false, parsers = { 'css' } },
        mode = 'background',
        tailwind = true,
    },
})
