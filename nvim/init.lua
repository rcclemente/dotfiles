require "user.options"
require "user.keymaps"
require "user.autocommands"
require "user.plugins"

require "user.plugins.autopairs"
require "user.plugins.bufferline"
require "user.plugins.colorscheme"
require "user.plugins.filetype" -- set file extension to filetype
require "user.plugins.lualine"
require "user.plugins.nvim-tree"
require "user.plugins.commenter"

require "user.plugins.mason" -- installs languages
require "user.plugins.completions" -- completions options
require "user.plugins.lsp" -- completions options
require "user.plugins.treesitter" -- completions options
require "user.plugins.vim-illuminate" -- illuminate same word
