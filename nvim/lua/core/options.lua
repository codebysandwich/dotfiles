--[[--
File              : options.lua
Author            : sandwich
Date              : 2023-10-19 12:40:50
Last Modified Date: 2026-02-10 14:01:45
Last Modified By  : sandwich
--]]
--
--              _   _
--   ___  _ __ | |_(_) ___  _ __  ___
--  / _ \| '_ \| __| |/ _ \| '_ \/ __|
-- | (_) | |_) | |_| | (_) | | | \__ \
--  \___/| .__/ \__|_|\___/|_| |_|___/
--       |_|

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
opt.foldlevelstart = 99

-- coc
opt.backup = false
opt.writebackup = false
opt.updatetime = 100
opt.signcolumn = "yes"

-- guicursor
-- opt.guicursor = {
--     "n-v-c:block", "i-ci-ve:ver25", "r-cr:hor20", "o:hor50", "a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor",
--     "sm:block-blinkwait175-blinkoff150-blinkon175"
-- }

-- opt.equalalways = false
-- opt.winfixwidth = true
-- opt.winfixheight = true

vim.g.loaded_perl_provider = 0
vim.g.python_host_skip_check = 1
vim.g.python3_host_skip_check = 1
vim.g.python3_host_prog = '/usr/local/bin/python3'
vim.g.ruby_host_skip_check = 1
vim.g.ruby_host_prog = vim.fn.exepath(vim.env.GEMPATH .. '/neovim-ruby-host')
vim.g.node_host_skip_check = 1
vim.g.node_host_prog = '/usr/local/bin/neovim-node-host'

-- vim.cmd("nohlsearch")

-- vim.cmd([[
--     " syntax enable
--     " syntax on
--     exec "nohlsearch"
--     " Disable folding at startup.
--     set foldlevelstart=99
--     " FIXME: iterm disable Cursor flash
--     set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
--       \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
--       \,sm:block-blinkwait175-blinkoff150-blinkon175
-- ]])
