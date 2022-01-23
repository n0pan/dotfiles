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
  }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
}

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.tsx.used_by = { "javascript", "typescript.tsx" }
