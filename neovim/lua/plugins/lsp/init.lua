local mason_lspconfig_installed, _ = pcall(require, "mason-lspconfig")
local lspconfig_installed, _ = pcall(require, "lspconfig")
if not mason_lspconfig_installed then
  print "[Warning] mason-lspconfig not found"
  return
end
if not lspconfig_installed then
  print "[Warning] lspconfig not found"
  return
end

require("plugins.lsp.lsp_install")
