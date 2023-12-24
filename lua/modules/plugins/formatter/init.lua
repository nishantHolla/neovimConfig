local util = require('formatter.util')

require('formatter').setup({
    logging = true,
    log_level = vim.log.levels.WARN,
    filetype = {
        lua = {
            function()
                if util.get_current_buffer_file_name() == 'special.lua' then
                    return nil
                end

                return {
                    exe = 'stylua',
                    args = {
                        '--search-parent-directories',
                        '--stdin-filepath',
                        util.escape_path(util.get_current_buffer_file_path()),
                        '--',
                        '-',
                    },
                    stdin = true,
                }
            end,
        },

        cpp = {
            function()
                local path = os.getenv('XDG_CONFIG_HOME')
                    .. '/nvim/lua/modules/plugins/formatter/clang-format'
                return {
                    exe = 'clang-format',
                    stdin = true,
                    args = {
                        '--style=file:' .. path,
                    },
                }
            end,
        },

        python = {
            function()
                return {
                    exe = 'black',
                    args = { '-q', '-' },
                    stdin = true,
                }
            end,
        },

        javascript = {
            function()
                return {
                    exe = 'prettier',
                    args = {
                        util.escape_path(util.get_current_buffer_file_path()),
                        '--tab-width 4',
                    },
                    stdin = true,
                }
            end,
        },

        astro = {
            function()
                return {
                    exe = 'prettier',
                    args = {
                        util.escape_path(util.get_current_buffer_file_path()),
                        '--tab-width 4',
                    },
                    stdin = true,
                }
            end,
        },

        typescriptreact = {
            function()
                return {
                    exe = 'prettier',
                    args = {
                        util.escape_path(util.get_current_buffer_file_path()),
                        '--tab-width 4',
                        '--print-width 80',
                    },
                    stdin = true,
                }
            end,
        },

        javascriptreact = {
            function()
                return {
                    exe = 'prettier',
                    args = {
                        util.escape_path(util.get_current_buffer_file_path()),
                        '--tab-width 4',
                    },
                    stdin = true,
                }
            end,
        },

        css = {
            function()
                return {
                    exe = 'prettier',
                    args = {
                        util.escape_path(util.get_current_buffer_file_path()),
                        '--tab-width 4',
                    },
                    stdin = true,
                }
            end,
        },

        scss = {
            function()
                return {
                    exe = 'prettier',
                    args = {
                        util.escape_path(util.get_current_buffer_file_path()),
                        '--tab-width 4',
                    },
                    stdin = true,
                }
            end,
        },
        html = {
            function()
                return {
                    exe = 'htmlbeautifier',
                    stdin = 1,
                }
            end,
        },
        svg = {
            function()
                return {
                    exe = 'htmlbeautifier',
                    stdin = 1,
                }
            end,
        },

        ['*'] = {
            require('formatter.filetypes.any').remove_trailing_whitespace,
        },
    },
})
