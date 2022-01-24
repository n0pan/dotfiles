require("plugins")

require("settings.options")
require("settings.lsp")
require("settings.colorscheme")
require("settings.mappings")

require("plugins.cmp")
require("plugins.telescope")
require("plugins.treesitter")
require("plugins.lualine")
require("plugins.black")
require("plugins.quick-scope")

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost lua/plugins.lua source <afile> | PackerCompile
  augroup end
]])
