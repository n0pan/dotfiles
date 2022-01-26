vim.cmd("noremap <C-b> :noh<cr>:call clearmatches()<cr>") -- clear matches Ctrl+b

local options = { noremap = true, silent = true }

local function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, options)
end

local function nmap(shortcut, command)
  map("n", shortcut, command)
end

local function imap(shortcut, command)
  map("i", shortcut, command)
end

local function vmap(shortcut, command)
  map("v", shortcut, command)
end

local function cmap(shortcut, command)
  map("c", shortcut, command)
end

local function tmap(shortcut, command)
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
  let NERDTreeShowHidden = 1
  let NERDTreeShowLineNumbers = 1
]])

-- Prettier --
nmap("<leader>pre", "<cmd>Prettier<cr>")

-- Black --
nmap("<leader>bla", "<cmd>Black<cr>")

-- Telescope --
nmap("<leader>sf", "<cmd>lua require('telescope.builtin').find_files()<cr>")
nmap("<leader>ss", "<cmd>lua require('telescope.builtin').live_grep()<cr>")
nmap("<leader>bf", "<cmd>lua require('telescope.builtin').buffers()<cr>")

-- LSP --
nmap("<leader>f", "<cmd>lua vim.lsp.buf.formatting()<cr>")
nmap("<leader>gd", "<cmd>lua vim.lsp.buf.declaration()<cr>")
nmap("<leader>jd", "<cmd>lua vim.lsp.buf.definition()<cr>")
nmap("<leader>td", "<cmd>lua vim.lsp.buf.type_definition()<cr>")
nmap("<leader>rn", "<cmd>lua vim.lsp.buf.rename()<cr>")
nmap("<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>")

-- git signs --
nmap("<leader>gb", "<cmd>Gitsigns toggle_current_line_blame<cr>")
nmap("<leader>gs", "<cmd>Gitsigns toggle_signs<cr>")
