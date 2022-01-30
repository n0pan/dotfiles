local gitsigns_present, gitsigns = pcall(require, "gitsigns")

if not gitsigns_present then
  return
end

gitsigns.setup({
  signcolumn = true,
  current_line_blame = false,
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = "eol",
    ignore_whitespace = false,
  },
  current_line_blame_formatter_opts = {
    relative_time = true,
  }
})
