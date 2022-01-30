local blankline_present, indent_blankline = pcall(require, "indent_blankline")

if not blankline_present then
  return
end

vim.opt.list = true
-- vim.opt.listchars:append("space:⋅")

indent_blankline.setup({
  show_end_of_line = false,
  -- space_char_blankline = " ",
  indentLine_enabled = 1,
  show_trailing_blankline_indent = false,
  show_first_indent_level = false,
})
