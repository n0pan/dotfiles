require("plugins")

require("settings.options")
require("settings.lsp")
require("settings.colorscheme")
require("settings.mappings")

require("plugins.completion")
require("plugins.telescope")
require("plugins.treesitter")
require("plugins.status_bar")
require("plugins.black")
require("plugins.quick_scope")

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost lua/plugins.lua source <afile> | PackerCompile
  augroup end
]])
