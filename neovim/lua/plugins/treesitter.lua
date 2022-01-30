local treesitter_configs_present, treesitter_configs = pcall(require, "nvim-treesitter.configs")
local treesitter_parsers_present, treesitter_parsers = pcall(require, "nvim-treesitter.parsers")

if not treesitter_configs_present or treesitter_parsers_present then
  return
end

treesitter_configs.setup({
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
    "regex",
    "lua",
    "svelte",
  },
  highlight = {
    enable = true,
    use_languagetree = true,
  },
  indent = {
    enable = true,
  },
})

local parser_config = treesitter_parsers.get_parser_configs()
parser_config.tsx.used_by = { "javascript", "typescript.tsx" }
