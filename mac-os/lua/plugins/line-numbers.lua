-- Show both absolute and relative line numbers on every line (side-by-side)
return {
  "shrynx/line-numbers.nvim",
  event = "BufEnter",
  opts = {
    mode = "both",      -- show both on all lines
    format = "abs_rel", -- absolute then relative (e.g. "42  3")
    separator = " ",
  },
}
