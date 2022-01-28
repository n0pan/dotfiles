local servers = require("utils.lsp_servers")
local lsp_installer = require("nvim-lsp-installer")
local lspconfig = require("lspconfig")

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
          globals = { "vim", "use", "require", "pairs", "print" }
        }
      }
    }
  end
  server:setup(options)
  vim.cmd([[ do User LspAttach Buffers ]])
end)

-- check and automatically install servers
for _, lsp_name in pairs(servers) do
  local server_is_found, server = lsp_installer.get_server(lsp_name)
  if server_is_found and not server:is_installed() then
    print("Installing " .. lsp_name .. "...")
    server:install()
  end
end

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

for _, lsp in pairs(servers) do
  lspconfig[lsp].setup({
    capabilities = capabilities,
  })
end

lspconfig.tsserver.setup({
  on_attach = function(client, bufnr)
    local ts_utils = require("nvim-lsp-ts-utils")
    -- defaults
    ts_utils.setup({
      debug = false,
      disable_commands = false,
      enable_import_on_completion = true,
      import_on_completion_timeout = 5000,

      -- eslint
      eslint_enable_code_actions = true,
      eslint_bin = "eslint",
      eslint_args = {"-f", "json", "--stdin", "--stdin-filename", "$FILENAME"},
      eslint_enable_disable_comments = true,

      -- experimental settings!
      -- eslint diagnostics
      eslint_enable_diagnostics = true,
      eslint_diagnostics_debounce = 250,

      -- formatting
      enable_formatting = true,
      formatter = "prettier",
      formatter_args = {"--stdin-filepath", "$FILENAME"},
      format_on_save = true,
      no_save_after_format = false,

      -- parentheses completion
      complete_parens = false,
      signature_help_in_parens = true,

      -- update imports on file move
      update_imports_on_move = false,
      require_confirmation_on_move = false,
    })

    -- required to enable ESLint code actions and formatting
    ts_utils.setup_client(client)

    -- no default maps, so you may want to define some here
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gs", ":TSLspOrganize<CR>", {silent = true})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "qq", ":TSLspFixCurrent<CR>", {silent = true})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", ":TSLspRenameFile<CR>", {silent = true})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", ":TSLspImportAll<CR>", {silent = true})
  end
})

vim.lsp.set_log_level("debug")
