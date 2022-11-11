local ls = require "luasnip"
require("luasnip/loaders/from_vscode").lazy_load()

ls.filetype_extend("all", { "_" })

ls.config.set_config({
  history = true,

  updateevents = "TextChanged, TextChangedI",

  enable_autosnippets = true,
})

vim.keymap.set({ "i", "s" }, "<c-k>", function()
  if ls.jumpable(1) then
    ls.jump(1)
  end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<c-j>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true })
