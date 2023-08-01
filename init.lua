
NvimConfig = {}

-- load modules

NvimConfig.options = require('modules.options')
NvimConfig.autocommands = require('modules.autocommands')

-- run modules

NvimConfig.options.set()
NvimConfig.autocommands.set()
