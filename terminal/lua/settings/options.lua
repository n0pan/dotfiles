HOME = os.getenv("HOME")

vim.g.mapleader = " "

-- options --
vim.o.termguicolors = true
vim.o.ignorecase = true
vim.o.hlsearch = true
vim.o.undolevels = 1000
vim.o.history = 1000
vim.o.lazyredraw = true
vim.o.clipboard = "unnamedplus"
vim.o.undofile = true
vim.o.undodir = HOME .. "~/.nvim/undo"
vim.o.noswapfile = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.expandtab = true
vim.o.smarttab = true
vim.o.rnu = true
vim.o.nu = true
vim.o.synmaxcol = 128
vim.o.mouse = 'a'
vim.o.autowrite = true

vim.cmd("syntax sync minlines=256")
