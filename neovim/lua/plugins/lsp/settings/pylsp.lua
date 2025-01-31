return {
  settings = {
    pylsp = {
      configurationSources = { 'pycodestyle' },
      plugins = {
        jedi_completion = { enabled = true },
        jedi_hover = { enabled = true },
        jedi_references = { enabled = true },
        jedi_signature_help = { enabled = true },
        flake8 = { enabled = false },
        black = {
          enabled = true,
          lineLength = 88,
        },
        pycodestyle = {
          ignore = { 'W391' },
          maxLineLength = 100
        }
      }
    }
  }
}
