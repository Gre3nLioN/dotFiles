return  {
  'nvim-lualine/lualine.nvim',
  dependencies = {'nvim-tree/nvim-web-devicons'},
  config = {
    options = {
      theme = 'molokai',
      icons_enabled = true,
      extensions = {
        'aerial',
        'chadtree',
        'fern',
        'fugitive',
        'fzf',
        'man',
        'mundo',
        'neo-tree',
        'nerdtree',
        'nvim-dap-ui',
        'nvim-tree',
        'quickfix',
        'symbols-outline',
        'toggleterm'
      }
    }
  }
}

