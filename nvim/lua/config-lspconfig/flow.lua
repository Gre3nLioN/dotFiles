local lsp_config = require('lspconfig')
local on_attach = require('config-lspconfig.on_attach')

lsp_config.flow.setup({
  on_attach = on_attach,
  init_options = {documentFormatting = false, codeAction = true},
  filetypes = { "javascript", "javascriptreact", "javascript.jsx" },
})
