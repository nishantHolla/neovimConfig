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

	['bufferline'] = {
		'akinsho/bufferline.nvim',
		enabled = true,
		hasConfig = true,
		description = 'Bufferline plugin'
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
		dependencies = {'akinsho/toggleterm.nvim'},
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
	}

}

plugins.set = function()
	local lazyPlugins = {}

	for pluginName, plugin in pairs(plugins.list) do
		if plugin.hasConfig then
			plugin.config = function()
				require('modules.plugins.' .. pluginName)
			end
		end

		table.insert(lazyPlugins, plugin)
	end

	require('lazy').setup(lazyPlugins)
end

return plugins
