vim.cmd("noremap <C-b> :noh<cr>:call clearmatches()<cr>") -- clear matches Ctrl+b

local utils = require("utils.mappings")
local vmap = utils.vmap
local nmap = utils.nmap
local imap = utils.imap

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

-- NvimTree --
nmap("<leader>ll", "<cmd>NvimTreeFindFile<CR>")
nmap("<leader>pp", "<cmd>NvimTreeClose<CR>")
nmap("<leader>oo", "<cmd>NvimTreeToggle<CR>")

-- Lualine --
nmap("<leader>1", "<cmd>LualineBuffersJump 1<CR>")
nmap("<leader>2", "<cmd>LualineBuffersJump 2<CR>")
nmap("<leader>3", "<cmd>LualineBuffersJump 3<CR>")
nmap("<leader>4", "<cmd>LualineBuffersJump 4<CR>")
nmap("<leader>5", "<cmd>LualineBuffersJump 5<CR>")
nmap("<leader>6", "<cmd>LualineBuffersJump 6<CR>")
nmap("<leader>7", "<cmd>LualineBuffersJump 7<CR>")
nmap("<leader>8", "<cmd>LualineBuffersJump 8<CR>")
nmap("<leader>9", "<cmd>LualineBuffersJump 9<CR>")

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
