-- Plugins module

local plugins = {}

-- bootstrap lazy plugin manager

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
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
		description = 'Statusline plugin'
	},

	['kanagawa'] = {
		'rebelot/kanagawa.nvim',
		enabled = true,
		hasConfig = false,
		description = 'Colorscheme'
	},

	['telescope'] = {
		'nvim-telescope/telescope.nvim',
		dependencies = {
			'nvim-lua/plenary.nvim',
			{
				'nvim-telescope/telescope-fzf-native.nvim',
				build =
				'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
			}
		},
		enabled = true,
		hasConfig = true,
		description = 'Find, filter, preview, pick'
	},

	['autoPairs'] = {
		'jiangmiao/auto-pairs',
		enabled = true,
		hasConfig = false,
		description = 'Autopair plugin'
	},

	['toggleTerm'] = {
		'akinsho/toggleterm.nvim',
		enabled = true,
		hasConfig = true,
		description = 'Terminal plugin'
	},

	['lf'] = {
		'lmburns/lf.nvim',
		dependencies = { 'akinsho/toggleterm.nvim' },
		enabled = true,
		hasConfig = true,
		description = 'File manager plugin'
	},

	['lspConfig'] = {
		'neovim/nvim-lspconfig',
		enabled = true,
		hasConfig = false,
		description = 'Language server protocol '
	},

	['mason'] = {
		'williamboman/mason.nvim',
		enabled = true,
		hasConfig = false,
		description = 'Langauge server management'
	},

	['nvimCmp'] = {
		'hrsh7th/nvim-cmp',
		dependencies = {
			'neovim/nvim-lspconfig',
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
			'delphinus/cmp-ctags',
			'hrsh7th/cmp-cmdline',
			'hrsh7th/cmp-vsnip',
			'hrsh7th/vim-vsnip',
			'hrsh7th/cmp-nvim-lsp-signature-help',
			'rafamadriz/friendly-snippets'
		},
		enabled = true,
		hasConfig = true,
		description = 'Completion tool'
	},

	['comment'] = {
		'numToStr/Comment.nvim',
		enabled = true,
		hasConfig = true,
		description = 'Comment plugin'
	},

	['hop'] = {
		'phaazon/hop.nvim',
		enabled = true,
		hasConfig = true,
		description = 'Movement plugin'
	},

	['gitSigns'] = {
		'lewis6991/gitsigns.nvim',
		enabled = true,
		hasConfig = true,
		description = 'Show git changes'
	},

	['treesitter'] = {
		'nvim-treesitter/nvim-treesitter',
		enabled = true,
		hasConfig = true,
		description = 'Syntax highlighting'
	},

	['nvimDap'] = {
		'mfussenegger/nvim-dap',
		dependencies = { 'rcarriga/nvim-dap-ui', 'suketa/nvim-dap-ruby' },
		enabled = true,
		hasConfig = true,
		description = 'Debug adapter protocol'
	},

	['guessIndent'] = {
		'NMAC427/guess-indent.nvim',
		enabled = true,
		hasConfig = true,
		description = 'Guess the indentation of the file'
	},

	['colorizer'] = {
		'norcalli/nvim-colorizer.lua',
		enabled = true,
		hasConfig = true,
		description = 'Colorize color string'
	},

	['liveServer'] = {
		'barrett-ruth/live-server.nvim',
		enabled = true,
		hasConfig = true,
		description = 'Refresh html page on save'
	},

	['miniSelection'] = {
		'echasnovski/mini.ai',
		enabled = true,
		hasConfig = true,
		description = 'Enhance a and i in nvim'
	},

	['indentLines'] = {
		'lukas-reineke/indent-blankline.nvim',
		enabled = true,
		hasConfig = true,
		description = 'File indentation'
	},

	['aerial'] = {
		'stevearc/aerial.nvim',
		enabled = true,
		hasConfig = true,
		description = 'Code outline'
	},

	['nvimWebDev'] = {
		'nvim-tree/nvim-web-devicons',
		enabled = true,
		hasConfig = true,
		description = 'Icons'
	}

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
