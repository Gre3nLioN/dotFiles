-- vim.cmd [[packadd packer.nvim]]
local fn      = vim.fn
local cmd     = vim.cmd
local execute = vim.api.nvim_command

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  execute 'packadd packer.nvim'
end

cmd('autocmd BufWritePost plugins.lua PackerCompile') -- Auto compile when there are changes in plugins.lua

require('packer').init({ display = { auto_clean = false } })

return require('packer').startup(function(use)
  -- Packer can manage itself as an optional plugin
  use 'wbthomason/packer.nvim'

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'tami5/lspsaga.nvim'
  use 'onsails/lspkind-nvim'
  use 'kosayoda/nvim-lightbulb'
  use 'williamboman/nvim-lsp-installer'
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'RishabhRD/popfix'
  use 'RishabhRD/nvim-lsputils'

  -- Autocomplete
  use 'L3MON4D3/LuaSnip'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use "hrsh7th/cmp-nvim-lua"
  use "hrsh7th/cmp-nvim-lsp-document-symbol"
  use "saadparwaiz1/cmp_luasnip"

  use 'mattn/emmet-vim'
  use 'rafamadriz/friendly-snippets'
  use { 'dsznajder/vscode-es7-javascript-react-snippets', run = 'yarn install --frozen-lockfile && yarn compile' }

  -- Treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'lukas-reineke/indent-blankline.nvim'
  use 'nvim-treesitter/nvim-treesitter-refactor'
  use 'windwp/nvim-ts-autotag'

  -- Icons
  use 'kyazdani42/nvim-web-devicons'
  use 'ryanoasis/vim-devicons'

  -- Status Line and Bufferline
  use 'NTBBloodbath/galaxyline.nvim'
  use 'romgrk/barbar.nvim'

  -- Telescope
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-media-files.nvim'
  use 'nvim-telescope/telescope-fzy-native.nvim'

  -- Explorer
  use 'kyazdani42/nvim-tree.lua'

  -- Color
  use 'christianchiarulli/nvcode-color-schemes.vim'
  use 'norcalli/nvim-colorizer.lua'

  -- Git
  use 'tpope/vim-fugitive'
  use 'f-person/git-blame.nvim'
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  use { 'tpope/vim-rhubarb', opt = true }

  -- General Plugins
  use "kylechui/nvim-surround"
  use 'chaoren/vim-wordmotion'
  use 'tpope/vim-repeat'
  use 'kevinhwang91/nvim-bqf'
  use 'numToStr/Comment.nvim'
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  use 'windwp/nvim-autopairs'
  use 'mileszs/ack.vim'
  use 'folke/zen-mode.nvim'
  use 'voldikss/vim-floaterm'
  use { 'ntpeters/vim-better-whitespace', opt = true }
  use { 'iamcco/markdown-preview.nvim', run = 'cd app && npm install', opt = true }
  use { 'junegunn/fzf', opt = true }
  use { 'junegunn/fzf.vim', opt = true }



  -- Tmux
  use 'tmux-plugins/vim-tmux'
  use 'christoomey/vim-tmux-navigator'

end)
