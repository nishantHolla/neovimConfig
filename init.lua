
NvimConfig = {}

-- load modules

NvimConfig.options = require('modules.options')
NvimConfig.autocommands = require('modules.autocommands')
NvimConfig.functions = require('modules.functions')
NvimConfig.keymaps = require('modules.keymaps')
NvimConfig.theme = require('modules.theme')

-- run modules

NvimConfig.options.set()
NvimConfig.autocommands.set()
NvimConfig.keymaps.set()
NvimConfig.theme.set()
