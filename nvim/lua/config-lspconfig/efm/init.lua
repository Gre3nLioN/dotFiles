local lsp_config = require('lspconfig')
local on_attach = require('config-lspconfig.on_attach')
local eslint = require('config-lspconfig.efm.eslint')
local prettier = require('config-lspconfig.efm.prettier')

local efm_config = os.getenv('HOME') .. '/.config/nvim/lua/config-lspconfig/efm/config.yaml'
local efm_log_dir = '/tmp/'
local efm_root_markers = { 'package.json', '.git/', '.zshrc' }
local efm_languages = {
  yaml = { prettier },
  json = { prettier },
  markdown = { prettier },
  javascript = { eslint, prettier },
  javascriptreact = { eslint, prettier },
  typescript = { eslint, prettier },
  typescriptreact = { eslint, prettier },
  css = { prettier },
  scss = { prettier },
  sass = { prettier },
  less = { prettier },
  graphql = { prettier },
  vue = { prettier },
  html = { prettier }
}

lsp_config.efm.setup({
  filetypes = {"python", "javascriptreact", "javascript", "sh", "html", "css", "json", "yaml", "markdown"},
  on_attach = on_attach,
  init_options = {
    documentFormatting = true,
    formatters = efm_languages
  },
  settings = {
    rootMarkers = efm_root_markers,
    languages = efm_languages,
  }
})
