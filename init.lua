
NvimConfig = {}

-- load modules

NvimConfig.plugins = require('modules.plugins')
NvimConfig.options = require('modules.options')
NvimConfig.autocommands = require('modules.autocommands')
NvimConfig.functions = require('modules.functions')
NvimConfig.keymaps = require('modules.keymaps')
NvimConfig.theme = require('modules.theme')

-- run modules

NvimConfig.plugins.set()
NvimConfig.options.set()
NvimConfig.autocommands.set()
NvimConfig.keymaps.set()
NvimConfig.theme.set()
