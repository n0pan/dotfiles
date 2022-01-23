require("plugins")

require("settings.options")
require("settings.colorscheme")
require("settings.lsp")
require("settings.mappings")

require("plugins.quick-scope")
require("plugins.telescope")
require("plugins.treesitter")
require("plugins.airline")
require("plugins.black")
require("plugins.cmp")

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost lua/plugins.lua source <afile> | PackerCompile
  augroup end
]])
