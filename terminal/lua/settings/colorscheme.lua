-- colorscheme --
vim.o.background = "dark"

-- github --
vim.g.github_transparent = true
vim.g.github_dark_sidebar = true
vim.g.github_keyword_style = "NONE"
vim.g.github_comment_style = "NONE"

-- catppuccin --
require("catppuccin").setup({
  transparent_background = true,
  term_colors = false,
  styles = {
    comments = "italic",
    functions = "NONE",
    keywords = "NONE",
    strings = "NONE",
    variables = "NONE",
  },
  integrations = {
    treesitter = true,
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = "italic",
        hints = "italic",
        warnings = "italic",
        information = "italic",
      },
      underlines = {
        errors = "underline",
        hints = "underline",
        warnings = "underline",
        information = "underline",
      },
    },
    gitgutter = true,
    nvimtree = {
      enabled = false,
    },
  }
})

vim.cmd([[ colorscheme catppuccin ]])
vim.cmd([[ let g:airline_theme="transparent" ]])
