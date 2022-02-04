local lspconfig_installed, _ = pcall(require, "lspconfig")
if not lspconfig_installed then
  print "[Warning] lspconfig not found"
  return
end

require("plugins.lsp.lsp_install")
