local g   = vim.g
local api = vim.api
local cmd = vim.cmd
local opt = { noremap = true, silent = true }

local function imap(lhs, rhs, opts)
  local options = { noremap = false }
  if opts then options = vim.tbl_extend('force', options, opts) end
  api.nvim_set_keymap('i', lhs, rhs, options)
end

api.nvim_set_keymap('n', '<Space>', '<NOP>', opt)
g.mapleader = ' '

-- no hl
api.nvim_set_keymap('n', '<leader>hh', ':set hlsearch!<CR>', opt)

-- clean search (highlight)
api.nvim_set_keymap('n', '<leader><Space>', ':noh<CR>', { silent = true })

-- split panes
api.nvim_set_keymap('n', '<leader>wv', ':vs<CR>', opt)
api.nvim_set_keymap('n', '<leader>wh', ':split<CR>', opt)

-- edit init.lua
api.nvim_set_keymap('n', '<leader>vi', ':e ~/.config/nvim/init.lua<CR>', opt)
api.nvim_set_keymap('n', '<leader><leader>x', ':w<cr>:source %<cr>', opt)
api.nvim_set_keymap('n', '<leader><leader>t', '<Plug>PlenaryTestFile', opt)

-- Telescope
cmd([[nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown({ winblend = 20 }))<cr>]])
cmd([[nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>]])
cmd([[nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>]])
cmd([[nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>]])
cmd([[nnoremap <leader>fgb :lua require('telescope.builtin').git_branches()<CR>]])
cmd([[nnoremap <leader>fw :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>]])
cmd([[nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>]])

cmd([[nnoremap <leader>ac :Ack!<Space>]])
cmd([[nnoremap <leader>bb :GitBlameToggle<CR>]])

-- LSP bindings
api.nvim_set_keymap('n', 'sd', '<cmd>lua vim.lsp.buf.definition()<CR>', opt)
api.nvim_set_keymap('n', 'gT', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opt)
api.nvim_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opt)
api.nvim_set_keymap('n', '<leader>df', '<cmd>lua vim.diagnostic.goto_next()<CR>', opt)
-- api.nvim_set_keymap('n', '<leader>sf', '<cmd>lua vim.lsp.buf.formatting()<CR>', opt)
-- api.nvim_set_keymap('n', '<leader>si', '<cmd>lua vim.lsp.buf.implementation()<CR>', opt)
-- api.nvim_set_keymap('n', '<leader>ssh', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opt)
-- api.nvim_set_keymap('n', '<leader>srr', '<cmd>lua vim.lsp.buf.references()<CR>', opt)
-- api.nvim_set_keymap('n', '<leader>srn', '<cmd>lua vim.lsp.buf.rename()<CR>', opt)
api.nvim_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opt)

-- Git
api.nvim_set_keymap('n', '<leader>gs', ':Git<CR>', { noremap = true })
api.nvim_set_keymap('n', '<leader>gb', ':Git blame<CR>', { noremap = true })
api.nvim_set_keymap('n', '<leader>gd', ':Gvdiff<CR>', { noremap = true })


-- search mappings: these will make it so that going to the next one in a
-- search will center on the line it's found in
cmd('nnoremap n nzzzv')
cmd('nnoremap N Nzzzv')
cmd('nnoremap N Nzzzv')



-- custom
cmd([[xnoremap p pgvy]])
cmd('nnoremap <space> za')
cmd('nnoremap <silent> <Leader>p :exe "%!python -m json.tool"<CR>')
cmd('nnoremap <leader>ai :ChatGPT<CR>')
cmd('vnoremap <silent> <leader>ai :<C-U>ChatGPTEditWithInstructions<CR>')


-- use ; as :
-- cmd('nnoremap ; :')

-- explorer
-- api.nvim_set_keymap('n', '<leader>ne', ':NvimTreeToggle<CR>', opt)
-- api.nvim_set_keymap('n', '<leader>nf', ':NvimTreeFindFile<CR>', opt)

-- better window movement
api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { silent = true })
api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { silent = true })
api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { silent = true })
api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { silent = true })

-- better indenting
api.nvim_set_keymap('v', '<', '<gv', opt)
api.nvim_set_keymap('v', '>', '>gv', opt)

-- I hate escape
api.nvim_set_keymap('i', 'jk', '<ESC>', opt)
api.nvim_set_keymap('i', 'kj', '<ESC>', opt)
api.nvim_set_keymap('i', 'jj', '<ESC>', opt)

-- Tab switch buffer
api.nvim_set_keymap('n', '<TAB>', ':bnext<CR>', opt)
api.nvim_set_keymap('n', '<S-TAB>', ':bprevious<CR>', opt)
api.nvim_set_keymap('n', '<leader>c', ':bd<CR>', opt)
api.nvim_set_keymap('n', '<leader>wc', ':close<CR>', opt)

-- Better nav for omnicomplete
cmd('inoremap <expr> <c-j> (\"\\<C-n>\")')
cmd('inoremap <expr> <c-k> (\"\\<C-p>\")')

-- zenmode
api.nvim_set_keymap('n', '<leader>z', "<cmd>lua require('zen-mode').toggle({ window = { width = .50 } })<cr>",
  { silent = true, noremap = true })

-- api.nvim_set_keymap('n', ':q', ':bd<CR>', opt)
--
vim.api.nvim_set_keymap("", "<leader>y", '"+y', { silent = true })


-- Custom functions
api.nvim_set_keymap('n', '<leader>f', ":%!python3 -m json.tool<CR>", { silent = true })
api.nvim_set_keymap('n', '<leader>ft', ":FloatermNew <CR>", { silent = true })
