syntax enable
syntax on
set encoding=utf8
set langmenu=en
set ts=4
set softtabstop=4
set shiftwidth=4
set autoindent

set number
set relativenumber
set showmode
set showcmd
set wildmenu

set hlsearch
exec "nohlsearch"
set incsearch
set ignorecase
set smartcase
set scrolloff=5
set hidden
set nobackup
set nowritebackup
set updatetime=100

" highlight
hi Comment ctermfg=7

inoremap ,, <esc>
noremap K 5k
noremap J 5j
nnoremap <silent> S :w<CR>
nnoremap <silent> Q :q<CR>
