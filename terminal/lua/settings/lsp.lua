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

-- LSP --
local attach_options = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", attach_options)
local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>jd", "<cmd>lua vim.lsp.buf.definition()<CR>", attach_options)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>td", "<cmd>lua vim.lsp.buf.type_definition()<CR>", attach_options)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", attach_options)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", attach_options)
end

for _, lsp_name in pairs(servers) do
  local server_is_found, server = lsp_installer.get_server(lsp_name)
  if server_is_found and not server:is_installed() then
    print("Installing " .. lsp_name .. "...")
    server:install()
  else require("lspconfig")[lsp_name].setup({
    on_attach = on_attach
  })
  end
end
