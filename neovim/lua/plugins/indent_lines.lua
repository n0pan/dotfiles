vim.opt.list = true
vim.opt.listchars:append("space:⋅")

require("indent_blankline").setup({
  show_end_of_line = false,
  space_char_blankline = " ",
  indentLine_enabled = 1,
  show_trailing_blankline_indent = false,
  show_first_indent_level = false,
})
