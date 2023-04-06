local opt = vim.opt

opt.termguicolors = true
opt.encoding = 'utf8'
opt.langmenu = 'en'
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.autoindent = true
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.showmode = true
opt.showcmd = true
opt.wildmenu = true
opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.scrolloff = 5
opt.hidden = true
opt.mouse = ''
opt.splitright = true
-- coc
opt.backup = false
opt.writebackup = false
opt.updatetime = 100
opt.signcolumn = "yes"


vim.cmd([[
	set foldmethod=indent
	set foldmethod=expr
	set foldexpr=nvim_treesitter#foldexpr()
	" Disable folding at startup.
	set foldlevelstart=99
	" FIXME: iterm disable Cursor flash
	set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
	  \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
	  \,sm:block-blinkwait175-blinkoff150-blinkon175
]])
