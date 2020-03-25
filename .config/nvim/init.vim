" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.config/nvim')

" Make sure you use single quotes
"
Plug 'ayu-theme/ayu-vim' " or other package manager
Plug 'Yggdroot/indentLine'
Plug 'junegunn/vim-slash'
Plug 'terryma/vim-multiple-cursors'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tomtom/tcomment_vim'
Plug 'kien/rainbow_parentheses.vim'
Plug 'pangloss/vim-javascript'
Plug 'scrooloose/nerdtree'
Plug 'jparise/vim-graphql'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'unblevable/quick-scope'
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
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-neco'
Plug 'neoclide/coc-html', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-pyls', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'kien/ctrlp.vim'
Plug 'skywind3000/asyncrun.vim'
Plug 'epilande/vim-es2015-snippets'
Plug 'epilande/vim-react-snippets'
Plug 'jparise/vim-graphql'

" HTML
Plug 'alvan/vim-closetag'

"" Javascript
Plug 'pangloss/vim-javascript'
Plug 'jelera/vim-javascript-syntax'
""" React / JSX
Plug 'mxw/vim-jsx'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'justinj/vim-react-snippets'
Plug 'mattn/emmet-vim'
Plug 'Valloric/MatchTagAlways'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'ianks/vim-tsx'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript', {'build': './install.sh'}

" Tools
Plug 'matze/vim-move'

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
set noswapfile
" 1 tab == 2 spaces.
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

let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=0
let NERDTreeShowLineNumbers=1

" au ColorScheme * hi Normal ctermbg=none guibg=none
" au ColorScheme myspecialcolors hi Normal ctermbg=red guibg=red

" Airline
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

" indentLine
let g:indentLine_setConceal = 0

" Prettier
let g:prettier#quickfix_enabled = 0
nmap <Leader>pre <Plug>(Prettier)

" CtrlP
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_regexp = 0
let g:ctrlp_use_caching = 1
let g:ctrlp_custom_ignore = {
  \ 'dir': '\v.(node_modules)',
  \ 'file': '\v.(\.tests\.)',
  \ }

fun! g:CtrlP_set_general_ignore()
  let general_ignore = '\v.(\.tests\.)'
  if g:ctrlp_custom_ignore.file != general_ignore
    let g:ctrlp_custom_ignore.file = general_ignore
    call ctrlp#clr()
  endif
 endfun

fun! g:CtrlP_set_test_ignore()
  let general_ignore = '\v(\.tests\.ts)@<!$'
  if g:ctrlp_custom_ignore.file != general_ignore
    let g:ctrlp_custom_ignore.file = general_ignore
    call ctrlp#clr()
  endif
 endfun

" Search
nnoremap <Leader>sf :call CtrlP_set_general_ignore()<CR>:CtrlP<CR>
nnoremap <Leader>sb :CtrlPBuffer<CR>
nnoremap <Leader>st :call CtrlP_set_test_ignore()<CR>:CtrlP<CR>
nnoremap <leader>ss :Ag<CR>

" FZF
com! -bar -bang Ag call fzf#vim#ag(<q-args>, fzf#vim#with_preview({'options': '--delimiter=: --nth=4..'}, 'right'), <bang>0)

" EMMET
let g:user_emmet_leader_key=','
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
  \      'extends' : 'jsx',
  \  },
  \}

" ASYNCRUN
autocmd BufWritePost *.js AsyncRun -post=checktime ./node_modules/.bin/eslint --fix %

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

let g:coc_snippet_next = '<tab>'

" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" Trigger a highlight only when pressing f and F.
let g:qs_highlight_on_keys = ['f', 'F']

autocmd BufNewFile,BufRead *.prisma   set syntax=graphql

call plug#end()

colorscheme onedark

let g:airline_theme='onedark'
i
