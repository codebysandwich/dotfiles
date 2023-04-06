"  _   _ _____ _____     _____ __  __
" | \ | | ____/ _ \ \   / /_ _|  \/  |
" |  \| |  _|| | | \ \ / / | || |\/| |
" | |\  | |__| |_| |\ V /  | || |  | |
" |_| \_|_____\___/  \_/  |___|_|  |_|
" =====
" -----------vim-plug-----------
" =====
" ===========speed up vim-plug=============
" let g:plug_url_format='https://gitclone.com/github.com/%s.git'
call plug#begin('~/.config/nvim/plugged')
Plug 'nvim-tree/nvim-web-devicons' " Recommended (for coloured icons)
Plug 'glepnir/dashboard-nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'akinsho/bufferline.nvim'
Plug 'p00f/nvim-ts-rainbow'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase', 'on': 'HexokinaseToggle' }
" gitsigns
Plug 'lewis6991/gitsigns.nvim'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'nvim-tree/nvim-tree.lua', {'tag': 'nightly', 'on': 'NvimTreeToggle'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'kevinhwang91/nvim-bqf'
" wakatime
Plug 'wakatime/vim-wakatime'
Plug 'preservim/nerdcommenter'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'lukas-reineke/virt-column.nvim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install', 'for': 'markdown'}
Plug 'mzlogin/vim-markdown-toc', {'for': 'markdown'}
Plug 'dhruvasagar/vim-table-mode', {'for': 'markdown'}
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'folke/todo-comments.nvim'
" Plug 'folke/noice.nvim'
" Plug 'MunifTanjim/nui.nvim'
" Plug 'rcarriga/nvim-notify'
" colorscheme
" Plug 'navarasu/onedark.nvim'
" Plug 'sainnhe/sonokai'
Plug 'codebysandwich/nvim-deus'
" Plug 'Shatur/neovim-ayu'
" highlighting syntax
" We recommend updating the parsers on update
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
" highlighting for Python in Neovim
" Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins', 'for': 'python'}
Plug 'gcmt/wildfire.vim'
Plug 'tpope/vim-surround'
Plug 'godlygeek/tabular'
Plug 'jiangmiao/auto-pairs'
Plug 'liuchengxu/vista.vim'
Plug 'mg979/vim-visual-multi'
Plug 'alpertuna/vim-header', {'on': 'AddHeader'}
Plug 'kshenoy/vim-signature'
Plug 'akinsho/toggleterm.nvim', {'tag' : '*', 'on': 'ToggleTerm'}
Plug 'kevinhwang91/rnvimr'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'for': 'go'}
Plug 'easymotion/vim-easymotion'
" Plug 'ggandor/leap.nvim'
" 前端插件
Plug 'mattn/emmet-vim', {'for': 'html'}
Plug 'ybian/smartim'
Plug 'folke/zen-mode.nvim'
" Initialize plugin system
call plug#end()
let mapleader=','
" =====
" -------------配色-----------------
" =====
set termguicolors
" =====
" ----------colorscheme----------
" =====
colorscheme deus
" source ~/.config/nvim/vim_plugin_snippets/onedark.lua
" source ~/.config/nvim/vim_plugin_snippets/ayu.lua
" source ~/.config/nvim/vim_plugin_snippets/sonokai.vim
" highlighting LineNr
hi CursorLineNr guifg=#FECB6B

" TODO: high version iterm2
" Enable blinking together with different cursor shapes for insert/command mode, and cursor highlighting:
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
  \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
  \,sm:block-blinkwait175-blinkoff150-blinkon175

" =====
" ----------airline----------
" =====
" source ~/.config/nvim/vim_plugin_snippets/airline.vim
" =====
" ----------lualine----------
" =====
source ~/.config/nvim/vim_plugin_snippets/lualine.lua
" =====
" ----------gitsigns----------
" =====
source ~/.config/nvim/vim_plugin_snippets/gitsigns.lua
" =====
" ----------bufferline----------
" =====
source ~/.config/nvim/vim_plugin_snippets/bufferline.lua
" =====
" ----------rainbow----------
" =====
" source ~/.config/nvim/vim_plugin_snippets/rainbow.lua
" =====
" ----------nvim-tree----------
" =====
source ~/.config/nvim/vim_plugin_snippets/nvimtree.lua
" =====
" ----------indent----------
" =====
source ~/.config/nvim/vim_plugin_snippets/blankline.lua
source ~/.config/nvim/vim_plugin_snippets/column.lua
" =====
" ----------zen-mode----------
" =====
source ~/.config/nvim/vim_plugin_snippets/zen-mode.lua
" =====
" ----------dashboard----------
" =====
source ~/.config/nvim/vim_plugin_snippets/dashboard.lua
" =====
" ----------markdown preview----------
" =====
let g:mkdp_browser='chromium'
let g:mkdp_auto_start = 0
" =====
" ----------nerdcommenter----------
" =====
let g:NERDCustomDelimiters = {"vim": {"left": "\" "}, "lua": {"left": "-- "}}
let g:NERDToggleCheckAllLines = 1
let g:NERDDefaultAlign = 'left'
" =====
" ----------fzf----------
" =====
" nnoremap <leader>a :Ag<CR>
" nnoremap <leader>b :Buffers<CR>
" noremap <leader>tf :FZF<CR>
" =====
" ----------telescope----------
" =====
source ~/.config/nvim/vim_plugin_snippets/telescope.lua
" =====
" ----------todo-comments----------
" =====
" NOTE this is test
source ~/.config/nvim/vim_plugin_snippets/todo_comments.lua
" =====
" ----------noice----------
" =====
" source ~/.config/nvim/vim_plugin_snippets/noice.lua
" =====
" ----------vim header----------
" =====
let g:header_field_author = 'sandwich'
let g:header_field_author_email = ''
let g:header_field_timestamp_format = '%Y-%m-%d %H:%M:%S'
let g:header_auto_add_header = 0
let g:header_auto_update_header = 1
autocmd BufNewFile,BufRead *.py,*.go,*.cpp,*.c,*h,*.java silent! AddHeader

" =====
" ----------vista----------
" =====
source ~/.config/nvim/vim_plugin_snippets/vista.vim
" =====
" ----------nvim-treesitter----------
" =====
source ~/.config/nvim/vim_plugin_snippets/nvim-treesitter.lua
" =====
" ----------illuminate----------
" =====
" source ~/.config/nvim/vim_plugin_snippets/illuminate.lua
" =====
" ----------semshi----------
" =====
" let g:semshi#mark_selected_nodes = 0
" autocmd InsertEnter *.py Semshi pause
" autocmd InsertLeave *.py Semshi enable
" =====
" ----------markdown TOC----------
" =====
" =====
" --------markdown table------------
" =====
source ~/.config/nvim/vim_plugin_snippets/markdowntable.vim
" =====
" ----------visual-Multi----------
" =====
let g:VM_maps = {}
let g:VM_maps["Add Cursor Down"]    = '<C-j>'   " new cursor down
let g:VM_maps["Add Cursor Up"]      = '<C-k>'   " new cursor up
" =====
" ----------vim-go----------
" =====
source ~/.config/nvim/vim_plugin_snippets/vim_go.vim
" =====
" ----------rnvimr----------
" =====
source ~/.config/nvim/vim_plugin_snippets/rnvimr.vim
" =====
" ----------coc----------
" =====
source ~/.config/nvim/vim_plugin_snippets/coc.vim
" =====
" ----------bqf----------
" =====
source ~/.config/nvim/vim_plugin_snippets/bqf.lua
" =====
" ----------toggleterm----------
" =====
source ~/.config/nvim/vim_plugin_snippets/toggleterm.lua
" =====
" ----------wildfire----------
" =====
let g:wildfire_objects = ["i'", 'i"', "i)", "i]", "i}", 
						 \"ip", "it", "i>", "i`"]
" fix disable enter in quickfix
let g:wildfire_fuel_map = get(g:, "wildfire_fuel_map", "<SPACE>")
" =====
" ----------easymotion----------
" =====
source ~/.config/nvim/vim_plugin_snippets/easymotion.vim
" =====
" ----------leap----------
" =====
" source ~/.config/nvim/vim_plugin_snippets/leap.lua
" =====
" ----------smartim----------
" =====
let g:smartim_default = 'com.apple.keylayout.ABC'
" ==================================================== 
syntax enable
syntax on
set encoding=utf8
" 绑定临时剪切板和系统剪切板
" set clipboard=unnamedplus
" let $LANG = 'en_US.UTF-8'
set langmenu=en
set ts=4
set softtabstop=4
set shiftwidth=4
set autoindent

set number
set relativenumber
set cursorline
set showmode
set showcmd
set wildmenu
" 设置折叠
set foldmethod=indent
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
" Disable folding at startup.
set foldlevelstart=99
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
" Don't pass messages to |ins-completion-menu|.
" set shortmess+=c
set signcolumn=yes
" set no mouse
set mouse=
set splitright

tnoremap <leader><Esc> <C-\><C-n>
nnoremap <M-right> <c-w>l
nnoremap <M-left> <c-w>h
nnoremap <M-down> <c-w>j
nnoremap <M-up> <c-w>k

inoremap <silent> ,, <esc>:w<CR>
vnoremap <silent> ,, <esc>

" nnoremap <c-e> $
nnoremap <c-a> 0
inoremap <c-e> <Esc>A
inoremap <c-a> <Esc>I

" =====
" ----------禁用方向键----------
" =====
inoremap <left> <nop>
inoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap <up> <nop>
nnoremap <down> <nop>
vnoremap <left> <nop>
vnoremap <right> <nop>
vnoremap <up> <nop>
vnoremap <down> <nop>

noremap <silent> <leader>l :nohlsearch<CR>

noremap K 5k
noremap J 5j
" =====
" ----------剪切板设置----------
" =====
vnoremap <leader>y "+y
nnoremap <leader>p "+p
nnoremap <leader>P "+P
" =====
" 快速移动文本[insert模式下C-v后再编辑alt-组合]
" =====
nnoremap <M-j> :m .+1<CR>==
nnoremap <M-k> :m .-2<CR>==
inoremap <M-j> <Esc>:m .+1<CR>==gi
inoremap <M-k> <Esc>:m .-2<CR>==gi
vnoremap <M-j> :m '>+1<CR>gv=gv
vnoremap <M-k> :m '<-2<CR>gv=gv
" =====
" ----------duplicate current line----------
" =====
inoremap <M-J> <Esc>yypA
inoremap <M-K> <Esc>yyPA
nnoremap <M-J> yyp
nnoremap <M-K> yyP

nnoremap <leader>w :bd<CR>
nnoremap <leader>q :bd!<CR>

"  TODO: in tmux
" nnoremap <C-i> <C-i>
" " nnoremap <tab> :bn<CR>
" nnoremap <leader><tab> :bn<CR>
" nnoremap <s-tab> :bp<CR>
" use switch tabs instead of buffers
nnoremap gt :bn<CR>
nnoremap gT :bp<CR>
" =====
" ----------切换工作目录到当前文件所在的目录----------
" =====
nnoremap <silent> <leader>. :cd %:p:h<CR>
" =====
" ----------source-language-file----------
" =====
source ~/.config/nvim/vim_plugin_snippets/autorun.vim

nnoremap <silent> S :w<CR>
nnoremap <silent> R :source $MYVIMRC<CR>
nnoremap <silent> Q :q<CR>

" speed neovim
nnoremap <silent> <Leader>C :!rm ~/.local/state/nvim/shada/main.shada<CR>
" set ttyfast
" set lazyredraw
let g:loaded_perl_provider = 0
let g:python_host_skip_check=1
let g:python_host_prog = '/usr/bin/python'
let g:python3_host_skip_check=1
let g:python3_host_prog = '/usr/local/bin/python3'
let g:ruby_host_skip_check=1
let g:ruby_host_prog = exepath($GEMPATH.'/neovim-ruby-host')
let g:node_host_skip_check=1
let g:node_host_prog = '/usr/local/bin/neovim-node-host'
