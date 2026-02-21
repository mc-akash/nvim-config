return {
  {
    "xiantang/darcula-dark.nvim",
    lazy = false,
    priority = 1000,
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      vim.cmd.colorscheme("darcula-dark")
      
      -- Color palette for barbar highlights
      local palette = {
        blue_bright = "#7FB3D9",
        blue_light = "#8FC9E8",
        blue_medium = "#6D9DC5",
        blue_dim = "#5A7A9B",
        bg_current = "#323232",
        bg_other = "#2B2B2B",
      }
      
      -- Fix buffer bar visibility (barbar.nvim) - MUST be after colorscheme
      -- Current buffer (active)
      vim.api.nvim_set_hl(0, "BufferCurrent", { fg = palette.blue_bright, bg = palette.bg_current, bold = true })
      vim.api.nvim_set_hl(0, "BufferCurrentSign", { fg = palette.blue_bright, bg = palette.bg_current })
      vim.api.nvim_set_hl(0, "BufferCurrentIndex", { fg = palette.blue_light, bg = palette.bg_current, bold = true })
      vim.api.nvim_set_hl(0, "BufferCurrentMod", { fg = palette.blue_bright, bg = palette.bg_current, bold = true })
      vim.api.nvim_set_hl(0, "BufferCurrentModBtn", { fg = palette.blue_bright, bg = palette.bg_current })
      
      -- Visible buffer (not active but visible)
      vim.api.nvim_set_hl(0, "BufferVisible", { fg = palette.blue_medium, bg = palette.bg_other })
      vim.api.nvim_set_hl(0, "BufferVisibleIndex", { fg = palette.blue_bright, bg = palette.bg_other })
      vim.api.nvim_set_hl(0, "BufferVisibleMod", { fg = palette.blue_medium, bg = palette.bg_other })
      vim.api.nvim_set_hl(0, "BufferVisibleModBtn", { fg = palette.blue_medium, bg = palette.bg_other })
      
      -- Inactive buffer
      vim.api.nvim_set_hl(0, "BufferInactive", { fg = palette.blue_dim, bg = palette.bg_other })
      vim.api.nvim_set_hl(0, "BufferInactiveSign", { fg = palette.blue_dim, bg = palette.bg_other })
      vim.api.nvim_set_hl(0, "BufferInactiveIndex", { fg = palette.blue_medium, bg = palette.bg_other })
      vim.api.nvim_set_hl(0, "BufferInactiveMod", { fg = palette.blue_dim, bg = palette.bg_other })
      vim.api.nvim_set_hl(0, "BufferInactiveModBtn", { fg = palette.blue_dim, bg = palette.bg_other })
    end,
  },
}
