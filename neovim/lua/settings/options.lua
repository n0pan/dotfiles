HOME = os.getenv("HOME")

vim.g.mapleader = " "

local options = {
-- options --
  guicursor = "", -- set cursor to always be a block
  ignorecase = true,
  hlsearch = true,
  undolevels = 1000,
  history = 1000,
  lazyredraw = true,
  clipboard = "unnamedplus",
  shiftwidth = 2,
  tabstop = 2,
  expandtab = true,
  smarttab = true,
  mouse = "a",
  autowrite = true,
  backspace = "indent,eol,start",
  laststatus = 2,
-- display --
  synmaxcol = 128,
  termguicolors = true,
-- line numbers --
  rnu = true,
  nu = true,
-- backup files --,
  undofile = true,
  undodir = HOME .. "/.nvim/undo",
  swapfile = false,
}

for key, value in pairs(options) do
  vim.opt[key] = value
end

vim.cmd("syntax sync minlines=256")
