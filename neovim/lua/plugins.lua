-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

  -- LSP --
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("plugins.lsp")
    end,
  },
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
      vim.cmd("MasonUpdate")
    end,
  },
  { "williamboman/mason-lspconfig.nvim" },

  -- Completion --
  {
    "hrsh7th/nvim-cmp",
    config = function()
      require("plugins.completion")
    end,
  },
  { "hrsh7th/cmp-nvim-lsp" },
  { "saadparwaiz1/cmp_luasnip" },
  { "L3MON4D3/LuaSnip" },

  -- Colorscheme --
  {
    "rebelot/kanagawa.nvim",
    name = "kanagawa",
    priority = 1000,
    config = function()
      require("settings.colorscheme")
      vim.cmd([[ colorscheme kanagawa ]])
    end,
  },

  -- Indent guides --
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("plugins.indent_lines")
    end,
  },

  -- Kitty config syntax highlighting --
  { "fladson/vim-kitty" },

  -- Statusline --
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("plugins.status_bar")
    end,
  },

  -- React / JSX --
  { "mattn/emmet-vim" },
  { "andymass/vim-matchup" },
  { "styled-components/vim-styled-components", branch = "main" },
  { "alvan/vim-closetag" },

  -- Markdown --
  {
    "iamcco/markdown-preview.nvim",
    lazy = true,
    build = "cd app && yarn install",
  },

  -- Linters / formatters --
  {
    "EgZvor/vim-black",
    config = function()
      require("plugins.black")
    end,
  },
  {
    "prettier/vim-prettier",
    build = "yarn install --frozen-lockfile --production",
  },

  -- Treesitter --
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("plugins.treesitter")
    end,
  },

  -- Telescope --
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("plugins.telescope")
    end,
  },

  -- Svelte --
  { "burner/vim-svelte" },

  -- Git --
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("plugins.git")
    end,
  },

  -- Quality of life --
  { "unblevable/quick-scope" },
  { "tmux-plugins/vim-tmux-focus-events" },
  { "tpope/vim-surround" },
  { "jiangmiao/auto-pairs" },
  { "mg979/vim-visual-multi" },
  { "tomtom/tcomment_vim" },
  { "junegunn/vim-slash" },

  -- File explorer --
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("plugins.nvimtree")
    end,
  },

  -- AI completion --
  {
    "supermaven-inc/supermaven-nvim",
    config = function()
      require("supermaven-nvim").setup({})
    end,
  },

  -- Zen mode --
  {
    "folke/zen-mode.nvim",
    opts = {
      plugins = {
        kitty = {
          enabled = true,
          font = "+2",
        },
      },
    },
  },

  -- Shared utilities --
  { "nvim-lua/plenary.nvim" },

})
