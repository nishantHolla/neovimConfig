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
	{
		'nvim-lualine/lualine.nvim',
		enabled = true,
		configName = 'lualine',
		description = 'Statusline plugin'
	},

	{
		'akinsho/bufferline.nvim',
		enabled = true,
		configName = 'bufferline',
		description = 'Bufferline plugin'
	},

	{
		'jiangmiao/auto-pairs',
		enabled = true,
		configName = nil,
		description = 'Autopair plugin'
	},
	
}

plugins.set = function()
	local lazyPlugins = {}

	for _, plugin in pairs(plugins.list) do
		if plugin.configName then
			plugin.config = function()
				require('modules.plugins.' .. plugin.configName)
			end
		end

		table.insert(lazyPlugins, plugin)
	end

	require('lazy').setup(lazyPlugins)
end

return plugins
