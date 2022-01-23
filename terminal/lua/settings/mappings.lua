function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function nmap(shortcut, command)
  map('n', shortcut, command)
end

function imap(shortcut, command)
  map('i', shortcut, command)
end

function vmap(shortcut, command)
  map('v', shortcut, command)
end

function cmap(shortcut, command)
  map('c', shortcut, command)
end

function tmap(shortcut, command)
  map('t', shortcut, command)
end

-- Indentation --
vmap('<', '<gv')
vmap('>', '>gv')

-- Moving lines up and down --
nmap('<C-j>', ':m .+1<CR>==')
nmap('<C-k>', ':m .-2<CR>==')
imap('<C-j>', '<Esc>:m .+1<CR>==gi')
imap('<C-k>', '<Esc>:m .-2<CR>==gi')
vmap('<C-j>', ":m '>+1<CR>gv=gv")
vmap('<C-k>', ":m '<-2<CR>gv=gv")

-- NERDTree --
nmap('<Leader>ll', ':NERDTreeFind')
nmap('<Leader>pp', ':NERDTreeClose')
nmap('<Leader>oo', ':NERDTreeToggle')

-- CoC --
imap('<C-l>' '<Plug>(coc-snippets-expand)')
imap('<C-j>' '<Plug>(coc-snippets-select)')

-- LSP --
