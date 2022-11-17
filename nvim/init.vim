"  _   _ _____ _____     _____ __  __
" | \ | | ____/ _ \ \   / /_ _|  \/  |
" |  \| |  _|| | | \ \ / / | || |\/| |
" | |\  | |__| |_| |\ V /  | || |  | |
" |_| \_|_____\___/  \_/  |___|_|  |_|
" =====
" -----------vim-plug-----------
" =====
" ===========speed up vim-plug=============
" let g:plug_url_format='https://git::@hub.fastgit.org/%s.git'
call plug#begin('~/.config/nvim/plugged')
Plug 'glepnir/dashboard-nvim', {'branch': 'remove-default-header'}
Plug 'nvim-lualine/lualine.nvim'
Plug 'akinsho/bufferline.nvim'
" gitsigns
Plug 'lewis6991/gitsigns.nvim'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" wakatime
Plug 'wakatime/vim-wakatime'
Plug 'preservim/nerdcommenter'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install', 'for': 'markdown'}
Plug 'mzlogin/vim-markdown-toc', {'for': 'markdown'}
Plug 'dhruvasagar/vim-table-mode', {'for': 'markdown'}
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
" colorscheme deus
Plug 'ajmwagar/vim-deus'
" Plug 'theniceboy/nvim-deus'
" Plug 'morhetz/gruvbox'
" Plug 'ayu-theme/ayu-vim'
" highlighting syntax
" We recommend updating the parsers on update
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" highlighting for Python in Neovim
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins', 'for': 'python'}
Plug 'kyazdani42/nvim-web-devicons' " Recommended (for coloured icons)
Plug 'gcmt/wildfire.vim'
Plug 'tpope/vim-surround'
Plug 'godlygeek/tabular'
Plug 'jiangmiao/auto-pairs'
Plug 'liuchengxu/vista.vim'
Plug 'mg979/vim-visual-multi'
Plug 'alpertuna/vim-header', {'on': 'AddHeader'}
Plug 'kshenoy/vim-signature'
Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}
Plug 'kevinhwang91/rnvimr'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'for': 'go'}
Plug 'easymotion/vim-easymotion'
" 前端插件
Plug 'mattn/emmet-vim', {'for': 'html'}
Plug 'ybian/smartim'
Plug 'folke/zen-mode.nvim'
Plug 'tweekmonster/startuptime.vim'
" Initialize plugin system
call plug#end()
let mapleader=','
" =====
" -------------配色-----------------
" =====
set termguicolors
" set t_Co=256
set background=dark
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" =====
" ----------gruvbox----------
" =====
" let g:gruvbox_contrast_dark = 'medium'
" colorscheme gruvbox
" =====
" ----------deus----------
" =====
colorscheme deus
" let g:deus_termcolors=256
" adjust signcolun and gitstatus
hi GitGutterAdd guifg=#98c379 guibg=#242a32
hi GitGutterChange guifg=#fabd2f guibg=#242a32
hi GitGutterChangeDelete guifg=#fe8019 guibg=#242a32
hi GitGutterDelete guifg=#fb4934 guibg=#242a32
" fix NonText to Comment force
hi NonText ctermfg=245 guifg=#928374 gui=none
" =====
" ----------ayu----------
" =====
" let ayucolor="mirage"
" colorscheme ayu

" 高亮LineNr的颜色 
" highlight LineNr guifg=#CDD9A
hi CursorLineNr guifg=#FECB6B
" hi CocInlayHint ctermfg=245 guifg=#928374 gui=none

" =====
" ----------airline----------
" =====
" if !exists('g:airline_symbols')
"     let g:airline_symbols = {}
" endif
" let g:airline_left_sep = ''
" let g:airline_left_alt_sep = ''
" let g:airline_right_sep = ''
" let g:airline_right_alt_sep = ''
" let g:airline_symbols.readonly = ''
" let g:airline_symbols.dirty=''
" let g:airline_symbols.linenr = '¶'
" let g:airline_symbols.maxlinenr = ''
" let g:airline_symbols.branch = ''
" let g:airline_symbols.colnr = ' '

" 是否打开tabline
" let g:airline#extensions#tabline#enabled = 1 "打开后，tabline和tmuxline都可以得到增强
" let g:airline#extensions#virtualenv#enabled = 1
" let g:airline#extensions#poetv#enabled = 1

" let g:airline_extensions = ['virtualenv', 'branch', 'hunks', 'coc', 'whitespace']
" let b:airline_whitespace_checks = ['conflicts']
" let g:airline#extensions#searchcount#enabled = 0
" let g:airline#extensions#tagbar#enabled = 0
" let g:airline#extensions#tabline#enabled = 0
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
" ----------indent----------
" =====
source ~/.config/nvim/vim_plugin_snippets/blankline.lua
" =====
" ----------zen-mode----------
" =====
source ~/.config/nvim/vim_plugin_snippets/zen-mode.lua
nnoremap <Leader>z :ZenMode<CR>
" =====
" ----------dashboard----------
" =====
source ~/.config/nvim/vim_plugin_snippets/dashboard.vim
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
" ----------vim header----------
" =====
let g:header_field_author = 'sandwich'
let g:header_field_author_email = ''
let g:header_field_timestamp_format = '%Y-%m-%d %H:%M:%S'
let g:header_auto_add_header = 0
let g:header_auto_update_header = 1
autocmd BufNewFile *.py,*.go,*.cpp,*.c,*h,*.java silent! AddHeader

" =====
" ----------vista----------
" =====
source ~/.config/nvim/vim_plugin_snippets/vista.vim
" =====
" ----------nvim-treesitter----------
" =====
source ~/.config/nvim/vim_plugin_snippets/nvim-treesitter.lua
" =====
" ----------semshi----------
" =====
let g:semshi#mark_selected_nodes = 0
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
" ----------emmet----------
" =====
let g:user_emmet_leader_key='<C-c>'
" =====
" ----------toggleterm----------
" =====
source ~/.config/nvim/vim_plugin_snippets/toggleterm.lua
" =====
" ----------easymotion----------
" =====
nmap <leader><leader>S <Plug>(easymotion-s2)
" vim-easymotion disturbs diagnostics
autocmd User EasyMotionPromptBegin silent! CocDisable
autocmd User EasyMotionPromptEnd silent! CocEnable
" =====
" ----------smartim----------
" =====
let g:smartim_default = 'com.apple.keylayout.ABC'
" ==================================================== 
" syntax enable
" syntax on
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
set foldlevelstart=99

set hlsearch
set incsearch
set ignorecase
set smartcase
set scrolloff=5

set hidden
set nobackup
set nowritebackup
set updatetime=100
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
set signcolumn=yes

" set no mouse and termial esc to normal mode
set mouse=
tnoremap <leader><Esc> <C-\><C-n>
set splitright
nnoremap <leader>L <c-w>l
nnoremap <leader>H <c-w>h
nnoremap <leader>J <c-w>j
nnoremap <leader>K <c-w>k

inoremap ,, <esc>:w<CR>
vnoremap ,, <esc> 

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
" ----------复制当前行到下一行上一行----------
" =====
inoremap <M-J> <Esc>yypA
inoremap <M-K> <Esc>yyPA
nnoremap <M-J> yyp
nnoremap <M-K> yyP

inoremap <leader>w <Esc>:bd<CR>
nnoremap <leader>w :bd<CR>
nnoremap <leader>q :bd!<CR>

nnoremap <tab> :bn<CR>
nnoremap <s-tab> :bp<CR>
" =====
" ----------切换工作目录到当前文件所在的目录----------
" =====
nnoremap <silent> <leader>. :cd %:p:h<CR>
" =====
" ----------source-file----------
" =====
source ~/.config/nvim/vim_plugin_snippets/python.vim
source ~/.config/nvim/vim_plugin_snippets/markdown.vim
source ~/.config/nvim/vim_plugin_snippets/go.vim
source ~/.config/nvim/vim_plugin_snippets/cpp.vim
source ~/.config/nvim/vim_plugin_snippets/c.vim
source ~/.config/nvim/vim_plugin_snippets/json.vim
source ~/.config/nvim/vim_plugin_snippets/java.vim

nnoremap S :w<CR>
nnoremap R :source $MYVIMRC<CR>
nnoremap Q :q<CR>

" speed neovim
nnoremap <Leader>C :!rm ~/.local/state/nvim/shada/main.shada<CR>
set ttyfast
set lazyredraw
let g:loaded_perl_provider = 0
let g:python_host_skip_check=1
let g:python_host_prog = '/usr/bin/python'
let g:python3_host_skip_check=1
let g:python3_host_prog = '/usr/local/bin/python3'
let g:ruby_host_skip_check=1
let g:ruby_host_prog = exepath($GEMPATH.'/neovim-ruby-host')
let g:node_host_skip_check=1
let g:node_host_prog = '/usr/local/bin/neovim-node-host'
