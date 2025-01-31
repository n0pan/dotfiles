local servers = require("utils.lsp_servers")
local lsp_installer_found, lsp_installer = pcall(require, "mason")
local _, mason_lspconfig = pcall(require, "mason-lspconfig")
local _, lspconfig = pcall(require, "lspconfig")

if not lsp_installer_found then
  print "[Warning] Cannot find mason"
  return
end

lsp_installer.setup({
  ui = {
    check_outdated_packages_on_open = true,
    border = "rounded",
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
})

local custom_settings = {
  jsonls = "plugins.lsp.settings.jsonls",
  luals = "plugins.lsp.settings.lua_ls",
  ts_ls = "plugins.lsp.settings.ts_ls",
  pylsp = "plugins.lsp.settings.pylsp",
}

local use_custom_settings = function(server_name, default_opts)
  if custom_settings[server_name] then
    local settings = require(custom_settings[server_name])
    return vim.tbl_deep_extend("force", default_opts, settings)
  end
  return default_opts
end

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

mason_lspconfig.setup({
  ensure_installed = servers,
  automatic_installation = true,
})

mason_lspconfig.setup_handlers {
  function(server_name)
    local default_opts = {
      capabilities = capabilities,
    }
    local opts = use_custom_settings(server_name, default_opts)
    lspconfig[server_name].setup(opts)
  end
}
