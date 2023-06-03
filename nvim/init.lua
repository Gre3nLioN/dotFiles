local g = vim.g

g.auto_save = 0

require("plugins")
require("globals")
require("utils")
require("settings")
require("mappings")

require("mason").setup()
require("mason-null-ls").setup({
    automatic_setup = true,
})

require("nvim-surround").setup({})
require("lsp-config.lsp")
require("config-cmp")
