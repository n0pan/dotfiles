local mason_lspconfig_installed, _ = pcall(require, "mason-lspconfig")
if not mason_lspconfig_installed then
  print "[Warning] mason-lspconfig not found"
  return
end

require("plugins.lsp.lsp_install")
