-- -- catppuccin --
-- require("catppuccin").setup({
--   flavour = "mocha",
--   transparent_background = true,
--   term_colors = false,
--   styles = {
--     comments = { "italic" },
--     conditionals = { "italic" },
--   },
--   float = {
--     transparent = true,
--     solid = false,
--   },
--   integrations = {
--     treesitter = true,
--     native_lsp = {
--       enabled = true,
--       virtual_text = {
--         errors = { "italic" },
--         hints = { "italic" },
--         warnings = { "italic" },
--         information = { "italic" },
--       },
--       underlines = {
--         errors = { "underline" },
--         hints = { "underline" },
--         warnings = { "underline" },
--         information = { "underline" },
--       },
--     },
--     lsp_trouble = false,
--     cmp = true,
--     lsp_saga = false,
--     gitgutter = false,
--     gitsigns = true,
--     telescope = true,
--     nvimtree = true,
--     indent_blankline = {
--       enabled = true,
--       colored_indent_levels = false,
--     },
--   }
-- })

-- -- kanagawa --
require('kanagawa').setup({
  compile = false,  -- enable compiling the colorscheme
  undercurl = true, -- enable undercurls
  commentStyle = { italic = true },
  functionStyle = {},
  keywordStyle = { italic = true },
  statementStyle = { bold = true },
  typeStyle = {},
  transparent = false,   -- do not set background color
  dimInactive = false,   -- dim inactive window `:h hl-NormalNC`
  terminalColors = true, -- define vim.g.terminal_color_{0,17}
  colors = {             -- add/modify theme and palette colors
    palette = {},
    theme = {
      wave = {},
      lotus = {},
      dragon = {},
      all = {
        ui = {
          bg_gutter = "none"
        }
      }
    },
  },
  overrides = function(colors) -- add/modify highlights
    return {}
  end,
  theme = "dragon",  -- Load "wave" theme
  background = {   -- map the value of 'background' option to a theme
    dark = "dragon", -- try "dragon" !
    light = "lotus"
  },
})
