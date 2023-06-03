return  {
  'nvim-tree/nvim-tree.lua',
  cmd = "Nvimtree",
  dependencies = {
    'nvim-tree/nvim-web-devicons', -- optional, for file icons
  },
  tag = 'nightly',
  keys = {
    {'<leader>ne', '<cmd>NvimTreeToggle<CR>', desc = 'toogle tree'},
    {'<leader>nf', '<cmd>NvimTreeFindFile<CR>', desc = 'find file in tree'}
  },
  config = {}
}
