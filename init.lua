NvimConfig = {}

-- util functions

function string.starts(String, Start)
    return string.sub(String, 1, string.len(Start)) == Start
end

-- load modules

NvimConfig.plugins = require('modules.plugins')
NvimConfig.options = require('modules.options')
NvimConfig.keymaps = require('modules.keymaps')
NvimConfig.autocommands = require('modules.autocommands')
NvimConfig.functions = require('modules.functions')
NvimConfig.theme = require('modules.theme')

-- run modules

NvimConfig.plugins.set()
NvimConfig.options.set()
NvimConfig.autocommands.set()
NvimConfig.keymaps.set()
NvimConfig.theme.set()
