local mapping_commands = {}

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

mapping_commands.map = map
mapping_commands.nmap =  nmap
mapping_commands.imap = imap
mapping_commands.vmap = vmap
mapping_commands.cmap = cmap
mapping_commands.tmap = tmap

return mapping_commands
