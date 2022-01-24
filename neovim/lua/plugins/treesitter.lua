require("nvim-treesitter.configs").setup {
ensure_installed = { 
    "tsx", 
    "json", 
    "yaml",
    "html",
    "scss",
    "css",
    "typescript",
    "javascript",
    "python",
    "regex", 
    "vim", 
    "dockerfile", 
    "bash",
    "graphql",
    "html",
    "regex"
  }, 
  highlight = {
    enable = true, 
  },
  indent = {
    enable = true,
  },
}

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.tsx.used_by = { "javascript", "typescript.tsx" }
