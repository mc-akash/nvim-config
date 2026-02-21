# Custom Snippets

This directory is for your custom LuaSnip snippets.

## Usage

Create snippet files for each language, for example:

- `go.lua` - Go snippets
- `lua.lua` - Lua snippets
- `javascript.lua` - JavaScript snippets

## Example

```lua
-- lua/snippets/go.lua
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s("iferr", {
    t({"if err != nil {", "\t"}),
    i(1, "return err"),
    t({"", "}"})
  }),
}
```

See [LuaSnip documentation](https://github.com/L3MON4D3/LuaSnip/blob/master/DOC.md) for more details.
