vim.cmd('noremap <C-b> :noh<cr>:call clearmatches()<cr>') -- clear matches Ctrl+b

function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function nmap(shortcut, command)
  map("n", shortcut, command)
end

function imap(shortcut, command)
  map("i", shortcut, command)
end

function vmap(shortcut, command)
  map("v", shortcut, command)
end

function cmap(shortcut, command)
  map("c", shortcut, command)
end

function tmap(shortcut, command)
  map("t", shortcut, command)
end

-- Indentation --
vmap("<", "<gv")
vmap(">", ">gv")

-- Moving lines up and down --
nmap("<C-j>", ":m .+1<CR>==")
nmap("<C-k>", ":m .-2<CR>==")
imap("<C-j>", "<Esc>:m .+1<CR>==gi")
imap("<C-k>", "<Esc>:m .-2<CR>==gi")
vmap('<C-j>', ':m ">+1<CR>gv=gv')
vmap('<C-k>', ':m "<-2<CR>gv=gv')

-- NERDTree --
nmap("<leader>ll", "<cmd>NERDTreeFind<CR>")
nmap("<leader>pp", "<cmd>NERDTreeClose<CR>")
nmap("<leader>oo", "<cmd>NERDTreeToggle<CR>")
vim.cmd([[
  let NERDTreeQuitOnOpen = 1
  let NERDTreeShowHidden = 0
  let NERDTreeShowLineNumbers = 1
]])

-- Prettier --
nmap("<leader>pre", "<cmd>Prettier<cr>")

-- Black --
nmap("<leader>bla", "<cmd>Black<cr>")

-- Telescope --
nmap("<leader>sf", "<cmd>Telescope find_files<cr>")
nmap("<leader>ss", "<cmd>Telescope live_grep<cr>")
nmap("<leader>fb", "<cmd>Telescope buffers<cr>")
nmap("<leader>fh", "<cmd>Telescope help_tags<cr>")

-- LSP --
