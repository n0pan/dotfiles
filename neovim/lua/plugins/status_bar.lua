require("lualine").setup({
  options = {
    icons_enabled = false,
    theme = "catppuccin",
    section_separators = "",
    component_separators = "",
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch", "diff", "diagnostics" },
    lualine_c = { "filename" },
    lualine_x = { "encoding", "fileformat", "filetype" },
    lualine_y = { "progress" },
    lualine_z = { "location" }
  },
  tabline = {
    lualine_a = {
      {
        "buffers",
        show_filename_only = true,
        show_modified_status = true,
        mode = 2 -- shows buffer name + buffer index
      }
    },
  },
  always_divide_middle = true
})