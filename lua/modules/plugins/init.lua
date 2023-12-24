-- Plugins module

local plugins = {}

-- bootstrap lazy plugin manager

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- plugins

plugins.list = {
    ['lualine'] = {
        'nvim-lualine/lualine.nvim',
        enabled = true,
        hasConfig = true,
        description = 'Statusline plugin',
    },

    ['bufferline'] = {
        'akinsho/bufferline.nvim',
        enabled = true,
        hasConfig = true,
        description = 'Bufferline plugin',
    },

    ['nightfox'] = {
        'EdenEast/nightfox.nvim',
        enabled = true,
        hasConfig = true,
        description = 'Colorscheme',
    },

    ['telescope'] = {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'BurntSushi/ripgrep',
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
            },
        },
        enabled = true,
        hasConfig = true,
        description = 'Find, filter, preview, pick',
    },

    ['autoPairs'] = {
        'jiangmiao/auto-pairs',
        enabled = true,
        hasConfig = false,
        description = 'Autopair plugin',
    },

    ['toggleTerm'] = {
        'akinsho/toggleterm.nvim',
        enabled = true,
        hasConfig = true,
        description = 'Terminal plugin',
    },

    ['lf'] = {
        'lmburns/lf.nvim',
        dependencies = { 'akinsho/toggleterm.nvim' },
        enabled = true,
        hasConfig = true,
        description = 'File manager plugin',
    },

    ['lspConfig'] = {
        'neovim/nvim-lspconfig',
        enabled = true,
        hasConfig = false,
        description = 'Language server protocol ',
    },

    ['tsTools'] = {
        'pmizio/typescript-tools.nvim',
        enabled = true,
        hasConfig = true,
        description = 'LSP for typescript',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'neovim/nvim-lspconfig',
        },
    },

    ['mason'] = {
        'williamboman/mason.nvim',
        enabled = true,
        hasConfig = false,
        description = 'Langauge server management',
        dependencies = {
            'WhoIsSethDaniel/mason-tool-installer.nvim',
        },
    },

    ['nvimCmp'] = {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'neovim/nvim-lspconfig',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-vsnip',
            'delphinus/cmp-ctags',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/vim-vsnip',
            'f3fora/cmp-spellrafamadriz/friendly-snippets',
            'roobert/tailwindcss-colorizer-cmp.nvim',
            'hrsh7th/cmp-nvim-lsp-signature-help',
            'onsails/lspkind.nvim',
        },
        enabled = true,
        hasConfig = true,
        description = 'Completion tool',
    },

    ['tailwind'] = {
        'laytan/tailwind-sorter.nvim',
        enabled = true,
        hasConfig = true,
        build = 'cd formatter && npm i && npm run build',
        description = 'Plugins for tailwind development',
    },

    ['comment'] = {
        'numToStr/Comment.nvim',
        enabled = true,
        hasConfig = true,
        description = 'Comment plugin',
    },

    ['hop'] = {
        'phaazon/hop.nvim',
        enabled = true,
        hasConfig = true,
        description = 'Movement plugin',
    },

    ['gitSigns'] = {
        'lewis6991/gitsigns.nvim',
        enabled = true,
        hasConfig = true,
        description = 'Show git changes',
    },

    ['treesitter'] = {
        'nvim-treesitter/nvim-treesitter',
        enabled = true,
        hasConfig = true,
        description = 'Syntax highlighting',
    },

    ['nvimDap'] = {
        'mfussenegger/nvim-dap',
        dependencies = { 'rcarriga/nvim-dap-ui', 'suketa/nvim-dap-ruby' },
        enabled = true,
        hasConfig = true,
        description = 'Debug adapter protocol',
    },

    ['guessIndent'] = {
        'NMAC427/guess-indent.nvim',
        enabled = true,
        hasConfig = true,
        description = 'Guess the indentation of the file',
    },

    ['colorizer'] = {
        'NvChad/nvim-colorizer.lua',
        enabled = true,
        hasConfig = true,
        description = 'Colorize color string',
    },

    ['liveServer'] = {
        'barrett-ruth/live-server.nvim',
        enabled = true,
        hasConfig = true,
        description = 'Refresh html page on save',
    },

    ['miniSelection'] = {
        'echasnovski/mini.ai',
        enabled = true,
        hasConfig = true,
        description = 'Enhance a and i in nvim',
    },

    ['indentLines'] = {
        'lukas-reineke/indent-blankline.nvim',
        enabled = true,
        hasConfig = true,
        description = 'File indentation',
    },

    ['align'] = {
        'junegunn/vim-easy-align',
        enabled = true,
        hasConfig = true,
        description = 'Alignment plugin',
    },

    ['nvimWebDev'] = {
        'nvim-tree/nvim-web-devicons',
        enabled = true,
        hasConfig = true,
        description = 'Icons',
    },

    ['formatter'] = {
        'mhartington/formatter.nvim',
        enabled = true,
        hasConfig = true,
        description = 'File formatter',
    },

    ['autotag'] = {
        'windwp/nvim-ts-autotag',
        enabled = true,
        hasConfig = true,
        description = 'Auto close tags',
    },

    ['surround'] = {
        'kylechui/nvim-surround',
        enabled = true,
        hasConfig = true,
        description = 'Surround selected elements with quotes and brackets',
    },

    ['dresser'] = {
        'stevearc/dressing.nvim',
        enabled = true,
        hasConfig = true,
        description = 'Input prompt',
    },
}

local tableCopy = function(_from, _to)
    for k, v in pairs(_from) do
        _to[k] = v
    end
end

plugins.set = function()
    local lazyPlugins = {}

    for pluginName, plugin in pairs(plugins.list) do
        if plugin.hasConfig then
            plugin.config = function()
                require('modules.plugins.' .. pluginName)
            end
        end

        local p = {}
        tableCopy(plugin, p)

        p.enabled = nil
        p.hasConfig = nil
        p.description = nil

        table.insert(lazyPlugins, p)
    end

    require('lazy').setup(lazyPlugins)
end

return plugins
