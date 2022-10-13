"  _   _ _____ _____     _____ __  __
" | \ | | ____/ _ \ \   / /_ _|  \/  |
" |  \| |  _|| | | \ \ / / | || |\/| |
" | |\  | |__| |_| |\ V /  | || |  | |
" |_| \_|_____\___/  \_/  |___|_|  |_|
" =====
" -----------vim-plug-----------
" =====
call plug#begin('~/.config/nvim/plugged')
" Plug 'mhinz/vim-startify'
Plug 'glepnir/dashboard-nvim'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'jmcantrell/vim-virtualenv', {'for': ['python', 'python3']}
" Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" wakatime
Plug 'wakatime/vim-wakatime'
Plug 'preservim/nerdcommenter'
Plug 'Yggdroot/indentLine'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'mzlogin/vim-markdown-toc'
Plug 'dhruvasagar/vim-table-mode'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }
Plug 'ajmwagar/vim-deus'
" Plug 'ayu-theme/ayu-vim'
" Plug 'jiangmiao/auto-pairs'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'ryanoasis/vim-devicons'
" Plug 'mg979/vim-xtabline'
Plug 'kyazdani42/nvim-web-devicons' " Recommended (for coloured icons)
" Plug 'ryanoasis/vim-devicons' Icons without colours
Plug 'akinsho/bufferline.nvim'
" Plug 'wfxr/minimap.vim'
Plug 'gcmt/wildfire.vim'
Plug 'tpope/vim-surround'
Plug 'godlygeek/tabular'
Plug 'liuchengxu/vista.vim'
Plug 'mg979/vim-visual-multi'
Plug 'alpertuna/vim-header'
" Plug 'preservim/tagbar'
Plug 'kshenoy/vim-signature'
" Plug 'francoiscabrol/ranger.vim'
Plug 'voldikss/vim-floaterm'
Plug 'kevinhwang91/rnvimr'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'kdheepak/lazygit.vim', { 'branch': 'nvim-v0.4.3' }
Plug 'easymotion/vim-easymotion'
" 前端插件
Plug 'mattn/emmet-vim'
" Plug 'voldikss/vim-translator'
Plug 'ybian/smartim'
Plug 'folke/zen-mode.nvim'
" Initialize plugin system
call plug#end()
" =====
"----------鼠标-----------------
" =====
if exists('$TMUX')
	let &t_SI = "\<Esc>Ptmux;\<Esc>\e[5 q\<Esc>\\"
	let &t_EI = "\<Esc>Ptmux;\<Esc>\e[2 q\<Esc>\\"
else
	let &t_SI = "\e[5 q"
	let &t_EI = "\e[2 q"
endif
" =====
" -------------配色-----------------
" =====
syntax enable
syntax on
let mapleader=','
if (has('termguicolors'))
  set termguicolors
endif
" let g:gruvbox_contrast_dark = 'medium'
set background=dark
" colorscheme gruvbox
set t_Co=256
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
" =====
" ----------deus----------
" =====
colorscheme deus
let g:deus_termcolors=256
" =====
" ----------ayu----------
" =====
" let ayucolor="mirage"
" colorscheme ayu

" 高亮LineNr的颜色
" highlight LineNr guifg=#CDD9CA
hi CursorLineNr guifg=#FECB6B

" =====
" ----------airline----------
" =====
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.dirty=''
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.colnr = ' '

" 是否打开tabline
" let g:airline#extensions#tabline#enabled = 1 "打开后，tabline和tmuxline都可以得到增强
let g:airline#extensions#virtualenv#enabled = 1
" =====
" ----------bufferline----------
" =====
lua << EOF
require("bufferline").setup{
	options = {
		show_buffer_close_icons = false,
		show_close_icon = false,
	},
	highlights = {
		fill = {
			guibg = '#21252C',
		},
		indicator_selected = {
			guifg = '#98C379',
		}
	}
}
EOF
" =====
" ----------zen-mode----------
" =====
lua << EOF
  require("zen-mode").setup {
	  window = {
		backdrop = 1,
		width = 1, 
		height = 1,
	  },
	  plugins = {
		options = {
		  showcmd = false,
		},
	  -- tmux = { enabled = true },
	  }
  }
EOF
nnoremap <Leader>z :ZenMode<CR>
" =====
" ----------dashboard----------
" =====
let g:dashboard_default_executive='fzf'
source ~/.config/nvim/vim_plugin_snippets/dashboard.vim
" =====
" ----------clap----------
" =====
" let g:clap_search_box_border_style='curve'
" let g:clap_popup_border='nil'
" let g:clap_insert_mode_only=v:true
" " let g:clap_open_preview='never'
" let g:clap_preview_direction='UD'
" let g:clap_theme = 'material_design_dark'

" =====
" ----------indentLine!!----------
" =====
let g:indentLine_setConceal=0
" =====
" ----------markdown preview----------
" =====
let g:mkdp_browser='chromium'
let g:mkdp_auto_start = 0
" =====
" ----------nerdcommenter----------
" =====
let g:NERDCustomDelimiters = {"vim": {"left": "\" "}}
let g:NERDToggleCheckAllLines = 1
let g:NERDDefaultAlign = 'left'
" =====
" ----------fzf----------
" =====
" let g:fzf_layout = { 'down': '~40%'}
" let g:fzf_preview_window = ['right:50%']
nnoremap <leader>a :Ag<CR>
nnoremap <leader>b :Buffers<CR>
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
" ----------tagbar----------
" =====
" nmap <leader>T :TagbarToggle<CR>

" =====
" ----------vista----------
" =====
source ~/.config/nvim/vim_plugin_snippets/vista.vim
" =====
" ----------semshi----------
" =====
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
" ----------lazygit----------
" =====
" setup mapping to call :LazyGit
nnoremap <silent> <leader>g :LazyGit<CR>
" =====
" ----------coc----------
" =====
source ~/.config/nvim/vim_plugin_snippets/coc.vim

" =====
" ----------emmet----------
" =====
let g:user_emmet_leader_key='<C-c>'
" =====
" ----------vim-floaterm----------
" =====
let g:floaterm_keymap_toggle = "<leader>j"
" =====
" ----------easymotion----------
" =====
nmap <leader><leader>S <Plug>(easymotion-s2)
" vim-easymotion disturbs diagnostics
" autocmd User EasyMotionPromptBegin silent! CocDisable
" autocmd User EasyMotionPromptEnd silent! CocEnable
" =====
" ----------smartim----------
" =====
let g:smartim_default = 'com.apple.keylayout.ABC'
" ==================================================== 
set encoding=utf8
" 绑定临时剪切板和系统剪切板
" set clipboard=unnamedplus
let $LANG = 'en_US.UTF-8'
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
" set foldmethod=manual

set hlsearch
exec "nohlsearch"
set incsearch
set ignorecase
set smartcase

" set cursor blinking in NeoVim
set guicursor+=a:-blinkwait175-blinkoff150-blinkon175

" set mouse=a
set scrolloff=5
inoremap ,, <esc>:w<CR>
vnoremap ,, <esc> 

inoremap <c-e> <Esc>A
inoremap <c-a> <Esc>I
" nnoremap <c-e> $
" nnoremap <c-a> ^

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


noremap <LEADER>l :nohlsearch<CR>

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

" speed vim
" set shada="None"
nnoremap <Leader>C :!rm ~/.local/share/nvim/shada/main.shada<CR>
let g:python_host_skip_check=1
let g:python_host_prog = '/usr/bin/python'
let g:python3_host_skip_check=1
let g:python3_host_prog = '/usr/local/bin/python3'

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
