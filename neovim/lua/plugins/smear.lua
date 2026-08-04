local setup, smear = pcall(require, "smear_cursor")
if not setup then
  return
end

smear.setup({
  never_draw_over_target = false,
  stiffness = 0.5,                      -- 0.6      [0, 1]
  trailing_stiffness = 0.45,            -- 0.45     [0, 1]
})
