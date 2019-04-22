" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.config/nvim')

" Make sure you use single quotes

Plug 'ayu-theme/ayu-vim' " or other package manager
Plug 'Yggdroot/indentLine'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'liuchengxu/space-vim-dark'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tomtom/tcomment_vim'
Plug 'kien/rainbow_parentheses.vim'
Plug 'pangloss/vim-javascript'
Plug 'scrooloose/nerdtree'
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
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
"" Javascript
Plug 'pangloss/vim-javascript'
Plug 'jelera/vim-javascript-syntax'
""" React / JSX
Plug 'mxw/vim-jsx'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'justinj/vim-react-snippets'
Plug 'mattn/emmet-vim'
Plug 'Valloric/MatchTagAlways'

set termguicolors     " enable true colors support

set background=dark
set ignorecase " Ignore case when searching.
set hlsearch " Highlight search results.
set undolevels=1000
set history=1000
set lazyredraw
set clipboard=unnamedplus
set undofile
set undodir=~/.nvim/undo

" 1 tab == 2 spaces.
set shiftwidth=2
set tabstop=2
set expandtab " Use spaces instead of tabs.
set smarttab " Be smart when using tabs.
set rnu " Display relative line numbers.
set nu
set synmaxcol=128
syntax sync minlines=256
vnoremap < <gv
vnoremap > >gv
nnoremap <Leader>ll :NERDTreeFind<CR>
nnoremap <Leader>pp :NERDTreeClose<CR>
nnoremap <Leader>oo :NERDTreeToggle<CR>

colorscheme xoria256

let g:airline_theme='base16'

let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=0
let NERDTreeShowLineNumbers=1

au ColorScheme * hi Normal ctermbg=none guibg=none
au ColorScheme myspecialcolors hi Normal ctermbg=red guibg=red

" Airline
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

highlight LineNr ctermbg=none ctermfg=237
highlight CursorLine ctermfg=210 ctermbg=237
highlight ColorColumn ctermbg=237
highlight Identifier ctermfg=5
highlight Identifier cterm=bold

call plug#end()
