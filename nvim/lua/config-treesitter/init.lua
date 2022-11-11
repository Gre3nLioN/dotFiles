local cmd = vim.cmd
local ts_config = require("nvim-treesitter.configs")

ts_config.setup {
  ensure_installed = {
    "javascript",
    "json",
    "yaml",
    "html",
    "css",
    "bash",
    "cpp",
    "rust",
    "lua",
    "ruby"
  },
  ignore_install = { "haskell" },
  highlight = {
    enable = true,
    use_languagetree = true
  },
  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false -- Whether the query persists across vim sessions
  },
  autotag = { enable = true },
  rainbow = { enable = true, extended_mode = true },
  context_commentstring = { enable = true, config = { javascriptreact = { style_element = '{/*%s*/}' } } },
  refactor = {
    highlight_definitions = {
      enable = true,
      -- Set to false if you have an `updatetime` of ~100.
      clear_on_cursor_move = true,
    },
    highlight_current_scope = { enable = false },
    smart_rename = {
      enable = true,
      keymaps = {
        smart_rename = "grr",
      },
    },
    navigation = {
      enable = true,
      keymaps = {
        goto_definition = "gnd",
        list_definitions = "gnD",
        list_definitions_toc = "gO",
        goto_next_usage = "<a-*>",
        goto_previous_usage = "<a-#>",
      },
    },
  }
}

cmd([[hi DiagnosticError guifg=#bf616a guibg=#2e3440]])
cmd([[hi DiagnosticWarn guifg=#e0af68 guibg=#2e3440]])
cmd([[hi DiagnosticInfo guifg=#0db9d7 guibg=#2e3440]])
cmd([[hi DiagnosticHint guifg=#4f5a75 guibg=#2e3440]])
