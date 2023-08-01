
NvimConfig = {}

-- load modules

NvimConfig.options = require('modules.options')
NvimConfig.autocommands = require('modules.autocommands')
NvimConfig.theme = require('modules.theme')

-- run modules

NvimConfig.options.set()
NvimConfig.autocommands.set()
NvimConfig.theme.set()
