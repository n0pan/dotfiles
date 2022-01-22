" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.config/nvim')

" TERMINAL CONFIG SYNTAX HIGHLIGHTING
Plug 'fladson/vim-kitty'

" EDITOR THEMES
Plug 'projekt0n/github-nvim-theme'
Plug 'Shatur/neovim-ayu'
Plug 'catppuccin/nvim', {'as': 'catppuccin'}

" AIRLINE THEMES
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" SYNTAX HIGHLIGHTING
Plug 'jparise/vim-graphql'
"" HTML
Plug 'alvan/vim-closetag'

"" REACT / JSX
Plug 'mattn/emmet-vim'
Plug 'Valloric/MatchTagAlways'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'HerringtonDarkholme/yats.vim'
Plug 'epilande/vim-react-snippets'

" PYTHON LINTER
Plug 'EgZvor/vim-black'

" MARKDOWN
Plug 'iamco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

" LINTING
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'branch': 'release/1.x',
  \ 'for': [
    \ 'javascript',
    \ 'typescript',
    \ 'css',
    \ 'less',
    \ 'scss',
    \ 'json',
    \ 'graphql',
    \ 'markdown',
    \ 'python',
    \ 'html' ] }

" TREESITTER
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'nvim-treesitter/playground'

" NERDTREE
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'

" TOOLS
" vim-slash removes search highlighting after cursor moves
Plug 'junegunn/vim-slash'

" Use C-n to toggle vim-multiple-cursors
Plug 'terryma/vim-multiple-cursors'

" Automatically creates pairs of parentheses, etc.
Plug 'jiangmiao/auto-pairs'

" Use cs to change surround
Plug 'tpope/vim-surround'
Plug 'tmux-plugins/vim-tmux-focus-events'
" Quick-scope: Highlights unique characters when pressing `f`/`F`/`t`/`T`
Plug 'unblevable/quick-scope'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" For async completion
Plug 'Shougo/deoplete.nvim'

" For Denite features
Plug 'Shougo/denite.nvim'

" Tools
Plug 'matze/vim-move'
" Allows quick (un)commenting using `gc`
Plug 'tomtom/tcomment_vim'

" Markdown
" If you have nodejs and yarn
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

" Git
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'

let mapleader="\<Space>"

set termguicolors " enable true colors support
set guicursor=
set background=dark
set ignorecase " Ignore case when searching.
set hlsearch " Highlight search results.
set undolevels=1000
set history=1000
set lazyredraw
set clipboard=unnamedplus
set undofile
set undodir=~/.nvim/undo
set noswapfile
set shiftwidth=2
set tabstop=2
set expandtab " Use spaces instead of tabs.
set smarttab " Be smart when using tabs.
set rnu " Display relative line numbers.
set nu
set synmaxcol=128
set noswapfile
set mouse=a
set autowrite
syntax sync minlines=256
vnoremap < <gv
vnoremap > >gv
nnoremap <Leader>ll :NERDTreeFind<CR>
nnoremap <Leader>pp :NERDTreeClose<CR>
nnoremap <Leader>oo :NERDTreeToggle<CR>
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" GITHUB THEME
let g:gh_color = "soft"

" NERDTREE
let NERDTreeQuitOnOpen = 1
let NERDTreeShowHidden = 0
let NERDTreeShowLineNumbers = 1

" SETS TRANSPARENT BACKGROUND FOR AYU THEME
au ColorScheme * hi Normal ctermbg=none guibg=none
" au ColorScheme myspecialcolors hi Normal ctermbg=red guibg=red

" AIRLINE
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

" PRETTIER
let g:prettier#quickfix_enabled = 0
nmap <Leader>pre <Plug>(Prettier)

" Black
nmap <Leader>bla :Black<CR>

" Find files using Telescope command-line sugar.
nnoremap <leader>sf <cmd>Telescope find_files<cr>
nnoremap <leader>sfa <cmd>Telescope find_files<cr>
nnoremap <leader>ss <cmd>Telescope live_grep<cr>
nnoremap <leader>ssa <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" EMMET
let g:user_emmet_leader_key=','
let g:user_emmet_settings = {
  \  'javascript': {
  \      'extends' : 'jsx',
  \  },
  \  'javascript.jsx' : {
  \      'extends' : 'jsx',
  \      'html' : {
  \          'quote_char': ""
  \      },
  \  },
  \}

"" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump) CoC-Snippets

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

nmap <silent> <Leader>jd :call CocActionAsync('jumpDefinition')<CR>
nmap <silent> <Leader>ji :call CocActionAsync('jumpImplementation', v:false)<CR>
nmap <silent> <Leader>jr :call CocActionAsync('jumpReferences', v:false)<CR>
nmap <silent> <Leader>jt :call CocActionAsync('jumpTypeDefinition', v:false)<CR>

let g:coc_snippet_next = '<tab>'

" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" Trigger a highlight only when pressing f and F.
let g:qs_highlight_on_keys = ['f', 'F']

call plug#end()

" treesitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
ensure_installed = { 
    "tsx", 
    "json", 
    "yaml",
    "html",
    "scss",
    "css",
    "typescript",
    "javascript",
    "python",
    "regex", 
    "vim", 
    "dockerfile", 
    "bash",
    "graphql",
    "html",
    "regex"
  }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
}
EOF

lua <<EOF
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.used_by = { "javascript", "typescript.tsx" }
EOF

lua <<EOF
require('telescope').setup({
  defaults = {
    file_ignore_patterns = { "node_modules" }
  }
})
EOF

" lua <<EOF
" require('ayu').setup({
"   mirage = false,
" })
" EOF

" GITHUB THEME
let g:github_transparent = "true"
let g:github_dark_sidebar = "true"
let g:github_keyword_style = "NONE"
let g:github_comment_style = "NONE"

" Black
let g:black_virtualenv = "~/.env/bin/black"

" catppuccin
lua << EOF
local catppuccin = require("catppuccin")

-- configure it
catppuccin.setup({
  transparent_background = true,
  term_colors = false,
  styles = {
    comments = "italic",
    functions = "NONE",
    keywords = "NONE",
    strings = "NONE",
    variables = "NONE",
  },
  integrations = {
    treesitter = true,
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = "italic",
        hints = "italic",
        warnings = "italic",
        information = "italic",
      },
      underlines = {
        errors = "underline",
        hints = "underline",
        warnings = "underline",
        information = "underline",
      },
    },
    lsp_trouble = false,
    cmp = true,
    lsp_saga = false,
    gitgutter = false,
    gitsigns = true,
    telescope = true,
    nvimtree = {
      enabled = true,
      show_root = false,
    },
    which_key = false,
    indent_blankline = {
      enabled = true,
      colored_indent_levels = false,
    },
    dashboard = true,
    neogit = false,
    vim_sneak = false,
    fern = false,
    barbar = false,
    bufferline = true,
    markdown = true,
    lightspeed = false,
    ts_rainbow = false,
    hop = false,
    notify = true,
    telekasten = true,
  }
})
EOF

colorscheme catppuccin

let g:airline_theme='transparent'
