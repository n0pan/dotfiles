" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.config/nvim')

" EDITOR THEMES
Plug 'ayu-theme/ayu-vim'
Plug 'rafi/awesome-vim-colorschemes'

" AIRLINE THEMES
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" SYNTAX HIGHLIGHTING
Plug 'jparise/vim-graphql'
"" HTML
Plug 'alvan/vim-closetag'

"" JAVASCRIPT
Plug 'pangloss/vim-javascript'
Plug 'jelera/vim-javascript-syntax'
Plug 'epilande/vim-es2015-snippets'

"" REACT / JSX
Plug 'maxmellon/vim-jsx-pretty'
Plug 'mattn/emmet-vim'
Plug 'Valloric/MatchTagAlways'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'HerringtonDarkholme/yats.vim'
Plug 'epilande/vim-react-snippets'

"" TYPESCRIPT
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
Plug 'ianks/vim-tsx'

" BLACK
Plug 'ambv/black'

" HANDLEBARS
Plug 'mustache/vim-mustache-handlebars'

" MARKDOWN
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

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

" DEBUGGER
Plug 'puremourning/vimspector'

" Use cs to change surround
Plug 'tpope/vim-surround'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'unblevable/quick-scope'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'kien/ctrlp.vim'

" For async completion
Plug 'Shougo/deoplete.nvim'

" For Denite features
Plug 'Shougo/denite.nvim'

" Tools
Plug 'matze/vim-move'
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

" START CTRLP 
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

nnoremap <Leader>sf :call CtrlP_set_general_ignore()<CR>:CtrlP<CR>
nnoremap <Leader>sb :CtrlPBuffer<CR>
nnoremap <Leader>st :call CtrlP_set_test_ignore()<CR>:CtrlP<CR>
nnoremap <leader>ss :Ag<CR>
" END CTRLP

" FZF
com! -bar -bang Ag call fzf#vim#ag(<q-args>, fzf#vim#with_preview({'options': '--delimiter=: --nth=4..'}, 'right'), <bang>0)

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

let g:coc_snippet_next = '<tab>'

" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" Trigger a highlight only when pressing f and F.
let g:qs_highlight_on_keys = ['f', 'F']

" Vimspector config
let g:vimspector_enable_mappings = 'HUMAN'

call plug#end()

colorscheme onedark

let g:airline_theme='transparent'
