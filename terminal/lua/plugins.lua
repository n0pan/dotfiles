return require("packer").startup(function ()
  use { "wbthomason/packer.nvim", opt = true }
  
  -- themes --
  use { "projekt0n/github-nvim-theme" }
  use { "Shatur/neovim-ayu" }
  use { "catppuccin/nvim", as = "catppuccin" }

  -- airline --
  use { "vim-airline/vim-airline" }
  use { "vim-airline/vim-airline-themes" }

  -- react / jsx --
  use { 
    "mattn/emmet-vim",
    setup = function ()
      vim.g.user_emmet_leader_key = ","
      vim.g.user_emmet_settings = { 
        "javascript" = {
          extends = "jsx"
        },
        "javascript.jsx" = {
          extends = "jsx",
          html = {
            "quote_char": ""
          }
        }
      }
  }
  use { "Valloric/MatchTagAlways" }
  use { "styled-components/vim-styled-components", branch = "main" }

  -- markdown --
  use { "iamco/markdown-preview.nvim", run = "cd app && yarn install" }

  -- linters --
  use { "EgZvor/vim-black" }
  use { "prettier/vim-prettier", run = "yarn install --frozen-lockfile --production"  }

  -- treesitter --
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
  use { "nvim-treesitter/playground" }

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
  use { "scrooloose/nerdtree" }
  use { "ryanoasis/vim-devicons" }
)
