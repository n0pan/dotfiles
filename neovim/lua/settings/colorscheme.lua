require('kanso').setup({
  bold = true,      -- enable bold fonts
  italics = true,   -- enable italics
  compile = false,  -- enable compiling the colorscheme
  undercurl = true, -- enable undercurls
  commentStyle = { italic = true },
  functionStyle = {},
  keywordStyle = { italic = true },
  statementStyle = {},
  typeStyle = {},
  transparent = true,    -- do not set background color
  dimInactive = false,   -- dim inactive window `:h hl-NormalNC`
  terminalColors = true, -- define vim.g.terminal_color_{0,17}
  colors = {             -- add/modify theme and palette colors
    palette = {},
    theme = { zen = {}, pearl = {}, ink = {}, all = {} },
  },
  overrides = function(colors) -- add/modify highlights
    return {}
  end,
  background = {          -- map the value of 'background' option to a theme
    dark = "zen",         -- try "zen", "mist" or "pearl" !
    light = "pearl"       -- try "zen", "mist" or "ink" !
  },
  foreground = "default", -- "default" or "saturated" (can also be a table like background)
  minimal = false,        -- reduced color palette for a more minimal look
})
