-- Extend LazyVim's LSP / Cmp / Mason instead of redefining. No duplicate setup.

return {
  -- LSP: extra servers + lua_ls settings + diagnostic tweaks
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      -- Diagnostics: show aggressively (in insert, virtual text with icons, float with header/source).
      -- Code actions (e.g. fix diagnostic): <leader>ca on the line with the diagnostic.
      opts.diagnostics = vim.tbl_deep_extend("force", opts.diagnostics or {}, {
        update_in_insert = true,
        virtual_text = {
          source = "always",  -- always show inline (not only "if_many")
          prefix = "icons",   -- severity icon per line (uses LazyVim icons)
        },
        float = {
          focusable = true,
          style = "default",  -- show header and source (not minimal)
          border = "rounded",
          source = "always",
          header = "",
          prefix = "",
        },
      })

      -- Ensure gopls is configured (LazyVim will install via mason-lspconfig)
      opts.servers = opts.servers or {}
      opts.servers.gopls = {}
      -- Merge lua_ls settings with LazyVim defaults (keep codeLens, completion, doc, hint)
      local lua_ls = opts.servers.lua_ls or {}
      lua_ls.settings = lua_ls.settings or {}
      lua_ls.settings.Lua = vim.tbl_deep_extend("force", lua_ls.settings.Lua or {}, {
        runtime = { version = "LuaJIT" },
        diagnostics = { globals = { "vim" } },
        workspace = {
          library = vim.api.nvim_get_runtime_file("", true),
          checkThirdParty = false,
        },
        format = {
          enable = true,
          defaultConfig = {
            indent_style = "space",
            indent_size = "2",
          },
        },
      })
      opts.servers.lua_ls = lua_ls
    end,
  },

  -- Cmp: Tab accepts the selected completion when menu is visible; otherwise snippet/fallback
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require("cmp")
      local lazyvim_cmp = require("lazyvim.util").cmp
      opts.mapping = vim.tbl_extend("force", opts.mapping or {}, {
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            lazyvim_cmp.confirm({ select = true })()
          else
            lazyvim_cmp.map({ "snippet_forward", "ai_nes", "ai_accept" }, fallback)()
          end
        end, { "i", "s" }),
      })
    end,
  },
}
