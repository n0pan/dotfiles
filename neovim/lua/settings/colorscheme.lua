require('nordic').setup({
  on_palette = function(palette) end,
  after_palette = function(palette) end,
  on_highlight = function(highlights, palette) end,
  bold_keywords = true,
  italic_comments = true,
  transparent = {
    bg = true,
    float = false,
  },
  bright_border = false,
  reduced_blue = true,
  swap_backgrounds = false,
  cursorline = {
    bold = false,
    bold_number = true,
    theme = 'light',
    blend = 0.15,
  },
  telescope = {
    style = 'flat',
  },
  leap = {
    dim_backdrop = false,
  },
  ts_context = {
    dark_background = true,
  },
})
