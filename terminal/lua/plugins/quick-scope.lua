-- trigger a highlight in the appropriate direction when pressing these keys --
vim.cmd([[  
  let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
]])

-- trigger a highlight only when pressing f and F --
vim.cmd([[
  let g:qs_highlight_on_keys = ['f', 'F']
]])
