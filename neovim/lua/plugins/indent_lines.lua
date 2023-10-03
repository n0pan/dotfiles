local blankline_present, ibl = pcall(require, "ibl")

if not blankline_present then
  return
end

vim.opt.list = true
-- vim.opt.listchars:append("space:⋅")

ibl.setup({
  enabled = true,
  scope = {
    show_end = false,
    show_start = false,
  },
  whitespace = {
    remove_blankline_trail = false,
  }
})
