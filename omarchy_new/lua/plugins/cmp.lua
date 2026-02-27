if true then return {} end
return {
  {
    "saghen/blink.cmp",
    dependencies = {
      {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp",
        dependencies = { "rafamadriz/friendly-snippets" },
        config = function()
          require("luasnip.loaders.from_vscode").lazy_load()
          -- Load custom Lua snippets only if directory exists
          local snippets_path = vim.fn.stdpath("config") .. "/lua/snippets"
          if vim.fn.isdirectory(snippets_path) == 1 then
            require("luasnip.loaders.from_lua").lazy_load({
              paths = { snippets_path },
            })
          end
        end,
      },
    },
    opts = {
      -- Use LuaSnip for snippet expansion/jumps
      snippets = { preset = "luasnip" },

      -- Blink sources configuration (NOT nvim-cmp style)
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
        providers = {}, -- keep table so validation never sees nil
      },

      -- Keymaps
      keymap = {
        preset = "default",
        ["<Tab>"] = { "accept", "snippet_forward", "fallback" },
        ["<S-Tab>"] = { "snippet_backward", "fallback" },
      },
    },
  },
}
