return {
  init_options = require("nvim-lsp-ts-utils").init_options,
  on_attach = function(client, bufnr)
    local ts_utils = require "nvim-lsp-ts-utils"

    ts_utils.setup {
      debug = false,
      disable_commands = false,
      enable_import_on_completion = false,
      import_all_timeout = 5000,
      import_all_priorities = {
        same_file = 1,
        local_files = 2,
        buffer_content = 3,
        buffers = 4,
      },
      import_all_scan_buffers = 100,
      import_all_select_source = false,
      always_organize_imports = false,
      filter_out_diagnostics_by_severity = {},
      filter_out_diagnostics_by_code = {},
      auto_inlay_hints = true,
      inlay_hints_highlight = "Comment",
      inlay_hints_priority = 200,
      inlay_hints_throttle = 150,
      inlay_hints_format = {
        Type = {},
        Parameter = {},
        Enum = {},
      },
      update_imports_on_move = true,
      require_confirmation_on_move = true,
      watch_dir = nil,
    }
    ts_utils.setup_client(client)

    client.server_capabilities.documentFormattingProvider = false
    -- require("plugins.configs.lsp.handlers").on_attach(client, bufnr)
  end,
}
