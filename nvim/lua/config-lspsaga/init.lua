local api = vim.api

local saga = require('lspsaga')

saga.init_lsp_saga()

api.nvim_set_keymap('n', 'K', ':Lspsaga hover_doc<CR>', { silent = true, noremap = true })
api.nvim_set_keymap('n', 'ca', ':Lspsaga code_action<CR>', { silent = true, noremap = true })

-- scroll down hover doc or scroll in definition preview
api.nvim_set_keymap('n', '<C-f>', "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>", { silent = true, noremap = true })
-- scroll up hover doc
api.nvim_set_keymap('n', '<C-f>', "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>", { silent = true, noremap = true })

api.nvim_set_keymap('n', 'cd', "<cmd>lua require('lspsaga.provider').preview_definition()<CR>", { silent = true, noremap = true })
-- show
api.nvim_set_keymap('n', '<Leader>cd', "<cmd>lua require('lspsaga.diagnostic').show_line_diagnostics()<CR>", { silent = true })
