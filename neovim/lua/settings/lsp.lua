local servers = require("utils.lsp_servers")
local lsp_installer = require("nvim-lsp-installer")

lsp_installer.settings({
  ui = {
    icons = {
      server_installed = "✓",
      server_pending = "➜",
      server_uninstalled = "✗",
    },
  },
})

lsp_installer.on_server_ready(function(server)
  local options = {  }
  if server.name == "sumneko_lua" then
    options.settings = {
      Lua = {
        diagnostics = {
          globals = { "vim", "use" }
        }
      }
    }
  end
  server:setup(options)
  vim.cmd([[ do User LspAttach Buffers ]])
end)

local attach_options = { noremap = true, silent = true }

vim.api.nvim_set_keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", attach_options)
vim.api.nvim_set_keymap('n', '<leader>gd', '<cmd>lua vim.lsp.buf.declaration()<CR>', attach_options)
vim.api.nvim_set_keymap("n", "<leader>jd", "<cmd>lua vim.lsp.buf.definition()<CR>", attach_options)
vim.api.nvim_set_keymap("n", "<leader>td", "<cmd>lua vim.lsp.buf.type_definition()<CR>", attach_options)
vim.api.nvim_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", attach_options)
vim.api.nvim_set_keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", attach_options)

-- check and automatically install servers
for _, lsp_name in pairs(servers) do
  local server_is_found, server = lsp_installer.get_server(lsp_name)
  if server_is_found and not server:is_installed() then
    print("Installing " .. lsp_name .. "...")
    server:install()
  end
end
