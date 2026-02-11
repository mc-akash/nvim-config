-- Disable LazyVim's default bufferline so barbar.nvim controls the tabline
-- (and can show buffer numbers). Without this, bufferline draws the tabline and barbar never appears.
return {
  {
    "akinsho/bufferline.nvim",
    enabled = false,
  },
}
