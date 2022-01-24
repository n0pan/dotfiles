-- install packer if not installed already
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function ()
  use { "wbthomason/packer.nvim", opt = true }

  -- themes --
  use { "projekt0n/github-nvim-theme" }
  use { "Shatur/neovim-ayu" }
  use { "catppuccin/nvim", as = "catppuccin" }

  -- LSP --
  use { "neovim/nvim-lspconfig" }
  use { "williamboman/nvim-lsp-installer" }
  use { "hrsh7th/nvim-cmp" }
  use { "hrsh7th/cmp-nvim-lsp" }
  use { "saadparwaiz1/cmp_luasnip" }
  use { "L3MON4D3/LuaSnip" }

  -- kitty config syntax highlighting
  use { "fladson/vim-kitty" }

  -- lualine --
  use {
    "nvim-lualine/lualine.nvim",
    requires = {
      "kyazdani42/nvim-web-devicons",
      opt = true
    }
  }

  -- react / jsx --
  use {
    "mattn/emmet-vim",
    setup = function ()
      vim.g.user_emmet_leader_key = ","
      vim.g.user_emmet_settings = {
        javascript = {
          extends = "jsx"
        },
        ["javascript.jsx"] = {
          extends = "jsx",
          html = {
            quote_char = ""
          }
        }
      }
    end
  }
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
  use { "EgZvor/vim-black" }
  use {
    "prettier/vim-prettier",
    run = "yarn install --frozen-lockfile --production"
  }

  -- treesitter --
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
  use { "nvim-treesitter/playground" }

  -- telescope --
  use {
    "nvim-telescope/telescope.nvim",
    requires = { { "nvim-lua/plenary.nvim" } }
  }

  -- git --
  use { "tpope/vim-fugitive" }
  use { "junegunn/gv.vim" }

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
    requires = { "ryanoasis/vim-devicons" }
  }
end)
