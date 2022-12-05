-- install packer if not installed already
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
    install_path })
end

vim.cmd [[packadd packer.nvim]]

require("packer").startup(function()
  use { "nvim-lua/plenary.nvim" }

  use { "wbthomason/packer.nvim" }

  -- LSP --
  use {
    "neovim/nvim-lspconfig",
    config = function()
      require("plugins.lsp")
    end,
  }
  use {
    "williamboman/nvim-lsp-installer",
  }

  use {
    "hrsh7th/nvim-cmp",
    config = function()
      require("plugins.completion")
    end,
  }
  use {
    "hrsh7th/cmp-nvim-lsp",
    "saadparwaiz1/cmp_luasnip",
    "L3MON4D3/LuaSnip",
  }
  use {
    "jose-elias-alvarez/nvim-lsp-ts-utils",
  }

  -- themes --
  use {
    "catppuccin/nvim",
    as = "catppuccin",
    enable = true,
    config = function()
      vim.o.background = "dark"
      vim.g.catppuccin_flavour = "mocha"
      require("settings.colorscheme")
      vim.cmd([[ colorscheme catppuccin ]])
    end,
  }

  -- indent lines --
  use {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("plugins.indent_lines")
    end,
  }

  -- kitty config syntax highlighting
  use { "fladson/vim-kitty" }

  -- lualine --
  use {
    "nvim-lualine/lualine.nvim",
    requires = {
      "kyazdani42/nvim-web-devicons",
      opt = true
    },
    config = function()
      require("plugins.status_bar")
    end,
  }

  -- react / jsx --
  use { "mattn/emmet-vim" }
  use { "Valloric/MatchTagAlways" }
  use { "styled-components/vim-styled-components", branch = "main" }
  use { "alvan/vim-closetag" }

  -- markdown --
  use {
    "iamcco/markdown-preview.nvim",
    opt = true,
    run = "cd app && yarn install"
  }

  -- linters --
  use {
    "EgZvor/vim-black",
    config = function()
      require("plugins.black")
    end,
  }
  use {
    "prettier/vim-prettier",
    run = "yarn install --frozen-lockfile --production"
  }

  -- treesitter --
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
      require("plugins.treesitter")
    end,
  }
  use { "nvim-treesitter/playground" }

  -- telescope --
  use {
    "nvim-telescope/telescope-fzf-native.nvim", run = "make"
  }
  use {
    "nvim-telescope/telescope.nvim",
    config = function()
      require("plugins.telescope")
    end,
  }

  -- svelte --
  use { "evanleck/vim-svelte" }

  -- flutter --
  use { 'akinsho/flutter-tools.nvim', requires = 'nvim-lua/plenary.nvim' }

  -- git --
  use {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("plugins.git")
    end,
  }

  -- quality of life --
  use { "unblevable/quick-scope" }
  use { "tmux-plugins/vim-tmux-focus-events" }
  use { "tpope/vim-surround" }
  use { "jiangmiao/auto-pairs" }

  -- use C-n to toggle vim-multiple-cursors
  use { "terryma/vim-multiple-cursors" }
  use { "tomtom/tcomment_vim" }

  -- removes search highlighting after cursor moves --
  use { "junegunn/vim-slash" }

  -- file explorer --
  use {
    'nvim-tree/nvim-tree.lua',
    config = function()
      require("plugins.nvimtree")
    end
  }

  use { 'kyazdani42/nvim-web-devicons' }

end)

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost lua/plugins.lua source <afile> | PackerCompile
  augroup end
]])
