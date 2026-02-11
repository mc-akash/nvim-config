-- add more treesitter parsers
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "dockerfile",
      "go",
      "gomod",
      "gosum",
      "gowork",
      "javascript",
      "json",
      "lua",
      "make",
      "markdown",
      "markdown_inline",
      "proto",
      "python",
      "query",
      "regex",
      "typescript",
      "tsx",
      "vim",
      "yaml",
    },
    indent = { enable = true },
    auto_install = true,
    sync_install = false,
    highlight = { enable = true },
    textobjects = { select = { enable = true, lookahead = true } }
  },
}
