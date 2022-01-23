-- colorscheme --
vim.o.background = "dark"

-- github --
vim.cmd("let g:")
vim.cmd('let g:github_transparent = "true"')
vim.cmd('let g:github_dark_sidebar = "true"')
vim.cmd('let g:github_keyword_style = "NONE"')
vim.cmd('let g:github_comment_style = "NONE"')

-- catppuccin --
require"catppuccin".setup({
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
    lsp_trouble = false,
    cmp = true,
    lsp_saga = false,
    gitgutter = false,
    gitsigns = true,
    telescope = true,
    nvimtree = {
      enabled = true,
      show_root = false,
    },
    which_key = false,
    indent_blankline = {
      enabled = true,
      colored_indent_levels = false,
    },
    dashboard = true,
    neogit = false,
    vim_sneak = false,
    fern = false,
    barbar = false,
    bufferline = true,
    markdown = true,
    lightspeed = false,
    ts_rainbow = false,
    hop = false,
    notify = true,
    telekasten = true,
  }
})

vim.cmd("colorscheme catppuccin")
vim.cmd("let g:airline_theme='transparent")