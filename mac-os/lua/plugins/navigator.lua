return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        gopls = {
          keys = {
            { "K", vim.lsp.buf.hover, desc = "Hover documentation" },
            -- Fill struct: cursor on or inside empty struct literal (e.g. Foo{})
            {
              "<leader>cP",
              function()
                vim.lsp.buf.code_action({
                  context = { only = { "refactor.rewrite.fillStruct" } },
                  apply = true,
                })
              end,
              desc = "Fill struct fields",
              has = "codeAction",
            },
          },
          settings = {
            gopls = {
              gofumpt = true,
              analyses = {
                unusedparams = true,
                nilness = true,
                unusedwrite = true,
              },
              staticcheck = true,
            },
          },
        },
      },
    },
  },
}
