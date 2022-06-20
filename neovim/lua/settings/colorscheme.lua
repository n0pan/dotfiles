-- catppuccin --
require("catppuccin").setup({
  transparent_background = true,
  term_colors = false,
  styles = {
    comments = "italic",
    conditionals = "italic",
    loops = "NONE",
    functions = "NONE",
    keywords = "NONE",
    strings = "NONE",
    variables = "NONE",
    numbers = "NONE",
    booleans = "NONE",
    properties = "NONE",
    types = "NONE",
    operators = "NONE",
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
      enabled = false,
    },
    indent_blankline = {
      enabled = true,
      colored_indent_levels = false,
    },
  }
})
