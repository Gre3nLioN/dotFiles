return {
  -- Packer can manage itself as an optional plugin
  'wbthomason/packer.nvim',
  {
    "williamboman/mason.nvim",
    "jose-elias-alvarez/null-ls.nvim",
    "jay-babu/mason-null-ls.nvim",
},

  -- LSP
  'neovim/nvim-lspconfig',
  'tami5/lspsaga.nvim',
  'onsails/lspkind-nvim',
  'kosayoda/nvim-lightbulb',
  'williamboman/nvim-lsp-installer',
  'RishabhRD/popfix',
  'RishabhRD/nvim-lsputils',
  'nvim-tree/nvim-web-devicons', -- optional, for file icons

  -- Autocomplete
  'L3MON4D3/LuaSnip',
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-nvim-lsp-document-symbol",
      "saadparwaiz1/cmp_luasnip",
    },
  },

  -- 'mattn/emmet-vim',
  'rafamadriz/friendly-snippets',
  { 'dsznajder/vscode-es7-javascript-react-snippets', build = 'yarn install --frozen-lockfile && yarn compile' },

  -- Treesitter
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate',
  opts = {
    highlight = {
      enable = true,
      -- Disable in large C++ buffers
      disable = function(lang, bufnr)
        return lang == "cpp" and vim.api.nvim_buf_line_count(bufnr) > 50000
      end,
    },
  }
},
  'lukas-reineke/indent-blankline.nvim',
  'nvim-treesitter/nvim-treesitter-refactor',
  'windwp/nvim-ts-autotag',

  -- Icons
  'ryanoasis/vim-devicons',

  -- Status Line and Bufferline
  -- 'NTBBloodbath/galaxyline.nvim',
  -- 'romgrk/barbar.nvim',

  -- Telescope
  'nvim-lua/popup.nvim',
  'nvim-lua/plenary.nvim',
  'nvim-telescope/telescope.nvim',
  'nvim-telescope/telescope-media-files.nvim',
  'nvim-telescope/telescope-fzy-native.nvim',

  -- 'preservim/tagbar',

  -- Color
  'christianchiarulli/nvcode-color-schemes.vim',
  'norcalli/nvim-colorizer.lua',

  -- Git
  'tpope/vim-fugitive',
  { 'lewis6991/gitsigns.nvim', dependencies = { 'nvim-lua/plenary.nvim' } },
  { 'tpope/vim-rhubarb', opt = true },

  -- General Plugins
  "kylechui/nvim-surround",
  -- 'chaoren/vim-wordmotion',
  'tpope/vim-repeat',
  'kevinhwang91/nvim-bqf',
  'JoosepAlviste/nvim-ts-context-commentstring',
  {
    'windwp/nvim-autopairs',
    config = function() require("nvim-autopairs").setup {} end
  },
  'mileszs/ack.vim',
  'voldikss/vim-floaterm',
  { 'ntpeters/vim-better-whitespace', opt = true },
  { 'iamcco/markdown-preview.nvim', build = 'cd app && npm install', opt = true },
  { 'junegunn/fzf', opt = true },
  { 'junegunn/fzf.vim', opt = true },
  {
    'terrortylor/nvim-comment',
    config = function()
      require('nvim_comment').setup({line_mapping = "<leader>/", operator_mapping = "<leader>/", comment_chunk_text_object = "ic"})
    end
  },

  ({
    "jackMort/ChatGPT.nvim",
    config = {
        openai_params = {
          model = "text-davinci-003",
          -- model = "text-curie-001",
          frequency_penalty = 0,
          presence_penalty = 0,
          max_tokens = 300,
          temperature = 0,
          top_p = 1,
          n = 1,
        },
        openai_edit_params = {
          model = "code-davinci-edit-001",
          -- model = "code-curie-edit-001",
          temperature = 0,
          top_p = 1,
          n = 1,
        },
      },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    }
  }),
  -- replace official copilot
  {
    'zbirenbaum/copilot.lua',
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup(
      {
        suggestion = { enabled = false },
        panel = { enabled = false },
      }
      )
    end,
  },
  -- to have copilot in cmp
  {
    "zbirenbaum/copilot-cmp",
    dependencies = { "copilot.lua" },
    config = function ()
      require("copilot_cmp").setup({
        formatters = {
          label = require("copilot_cmp.format").format_label_text,
          insert_text = require("copilot_cmp.format").format_insert_text,
          -- preview = require("copilot_cmp.format").deindent,
        },
      })
    end
  },
  {
    'ThePrimeagen/harpoon',
    dependencies={'nvim-lua/plenary.nvim'},
    config = function() require('harpoon').setup({
      global_settings = {
        -- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
        save_on_toggle = false,

        -- saves the harpoon file upon every change. disabling is unrecommended.
        save_on_change = true,

        -- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
        enter_on_sendcmd = false,

        -- closes any tmux windows harpoon that harpoon creates when you close Neovim.
        tmux_autoclose_windows = false,

        -- filetypes that you want to prevent from adding to the harpoon list menu.
        excluded_filetypes = { "harpoon" },

        -- set marks specific to each git branch inside git repository
        mark_branch = false,
      },
      menu = {
        width = vim.api.nvim_win_get_width(0) - 4,
      }
    }) end,
  },

  -- Tmux
  'tmux-plugins/vim-tmux',
  'christoomey/vim-tmux-navigator',
}
