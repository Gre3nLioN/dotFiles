local lsp_config = require('lspconfig')
local on_attach = require('config-lspconfig.on_attach')

lsp_config.ruby.setup({
  filetypes = {"ruby"},
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = false
    on_attach(client)
  end
})
