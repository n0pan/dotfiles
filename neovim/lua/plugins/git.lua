require("gitsigns").setup({
  signcolumn = true,
  current_line_blame = true,
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = "eol",
    ignore_whitespace = false,
  },
  current_line_blame_formatter_opts = {
    relative_time = true,
  }
})
