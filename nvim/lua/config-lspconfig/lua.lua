local lsp_config = require('lspconfig')
local on_attach = require('config-lspconfig.on_attach')

lsp_config.lua.setup({
  on_attach = on_attach,
  filetypes = {"lua"},
  settings = {
    Lua = {
      diagnostics = {
        enable = true,
        globals = {
          "vim",
          "describe",
          "it",
          "before_each",
          "after_each",
          "awesome",
          "theme",
          "client"
        }
      }
    }
  }
})
