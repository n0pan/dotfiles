-- install packer if not installed already
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

vim.cmd [[packadd packer.nvim]]

require("packer").startup(function ()
  use { "wbthomason/packer.nvim", opt = true }

  use { "nvim-lua/plenary.nvim" }

  -- LSP --
  use {
    "neovim/nvim-lspconfig",
    "williamboman/nvim-lsp-installer",
    "jose-elias-alvarez/nvim-lsp-ts-utils",
  }

  use {
    "hrsh7th/cmp-nvim-lsp",
    "saadparwaiz1/cmp_luasnip",
    "L3MON4D3/LuaSnip",
    "hrsh7th/nvim-cmp",
    config = [[ require("plugins.completion") ]]
  }

  -- themes --
  use { "projekt0n/github-nvim-theme" }
  use { "Shatur/neovim-ayu" }
  use { "catppuccin/nvim", as = "catppuccin" }

  -- indent lines --
  use {
    "lukas-reineke/indent-blankline.nvim",
    config = [[ require("plugins.indent_lines") ]]
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
    config = [[ require("plugins.status_bar") ]]
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
    config = [[ require("plugins.black") ]]
  }
  use {
    "prettier/vim-prettier",
    run = "yarn install --frozen-lockfile --production"
  }

  -- treesitter --
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = [[ require("plugins.treesitter") ]]
  }
  use { "nvim-treesitter/playground" }

  -- telescope --
  use {
    "nvim-telescope/telescope.nvim",
    config = [[ require("plugins.telescope") ]]
  }

  -- git --
  use {
    "lewis6991/gitsigns.nvim",
    tag = "release",
    config = [[ require("plugins.git") ]]
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
    "scrooloose/nerdtree",
    requires = { "ryanoasis/vim-devicons", opt = true }
  }
end)

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost lua/plugins.lua source <afile> | PackerCompile
  augroup end
]])
