HOME = os.getenv("HOME")

vim.g.mapleader = " "

-- options --
vim.o.guicursor = "" -- set cursor to always be a block
vim.o.ignorecase = true
vim.o.hlsearch = true
vim.o.undolevels = 1000
vim.o.history = 1000
vim.o.lazyredraw = true
vim.o.clipboard = "unnamedplus"
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.expandtab = true
vim.o.smarttab = true
vim.o.mouse = "a"
vim.o.autowrite = true
vim.o.backspace = "indent,eol,start"
vim.o.laststatus = 2

-- display --
vim.o.synmaxcol = 128
vim.o.termguicolors = true

-- line numbers --
vim.o.rnu = true
vim.o.nu = true

-- backup files --
vim.o.undofile = true
vim.o.undodir = HOME .. "/.nvim/undo"
vim.o.swapfile = false

vim.cmd("syntax sync minlines=256")
