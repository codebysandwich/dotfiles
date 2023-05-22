--  _  __          __  __
-- | |/ /___ _   _|  \/  | __ _ _ __  ___
-- | ' // _ \ | | | |\/| |/ _` | '_ \/ __|
-- | . \  __/ |_| | |  | | (_| | |_) \__ \
-- |_|\_\___|\__, |_|  |_|\__,_| .__/|___/
--           |___/             |_|

local set_keymap = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}

vim.g.mapleader = ','

-- esc in terminal
set_keymap('t', '<leader><Esc>', '<C-\\><C-n>', opts)
-- switch buffer window
set_keymap('n', '<M-right>', '<c-w>l', opts)
set_keymap('n', '<M-left>', '<c-w>h', opts)
set_keymap('n', '<M-down>', '<c-w>j', opts)
set_keymap('n', '<M-up>', '<c-w>k', opts)

set_keymap('i', '<leader><leader>', '<esc>:w<CR>', opts)
set_keymap('v', '<leader><leader>', '<esc>:w<CR>', opts)

-- cursor move fast in line
-- nnoremap <c-e> $
set_keymap('n', '<c-a>', '0', opts)
set_keymap('i', '<c-e>', '<Esc>A', opts)
set_keymap('i', '<c-a>', '<Esc>I', opts)


-- disable Directions keys
-- set_keymap('i', '<left>', '', opts)
-- set_keymap('i', '<right>', '', opts)
-- set_keymap('i', '<up>', '', opts)
-- set_keymap('i', '<down>', '', opts)
-- set_keymap('n', '<left>', '', opts)
-- set_keymap('n', '<right>', '', opts)
-- set_keymap('n', '<up>', '', opts)
-- set_keymap('n', '<down>', '', opts)
-- set_keymap('v', '<left>', '', opts)
-- set_keymap('v', '<right>', '', opts)
-- set_keymap('v', '<up>', '', opts)
-- set_keymap('v', '<down>', '', opts)

set_keymap('n', '<leader>l', ':nohlsearch<CR>', opts)
set_keymap('', 'K', '5k', opts)
set_keymap('', 'J', '5j', opts)

-- clipboard set
set_keymap('v', '<leader>y', '"+y', opts)
set_keymap('n', '<leader>p', '"+p', opts)
set_keymap('n', '<leader>P', '"+P', opts)
-- move fast
set_keymap('n', '<M-j>', ':m .+1<CR>==', opts)
set_keymap('n', '<M-k>', ':m .-2<CR>==', opts)
set_keymap('i', '<M-j>', '<Esc>:m .+1<CR>==gi', opts)
set_keymap('i', '<M-k>', '<Esc>:m .-2<CR>==gi', opts)
set_keymap('v', '<M-j>', ":m '>+1<CR>gv=gv", opts)
set_keymap('v', '<M-k>', ":m '<-2<CR>gv=gv", opts)
-- duplicate current line
set_keymap('i', '<M-J>', '<Esc>yypA', opts)
set_keymap('i', '<M-K>', '<Esc>yyPA', opts)
set_keymap('n', '<M-J>', 'yyp', opts)
set_keymap('n', '<M-K>', 'yyP', opts)
-- close buffer
set_keymap('n', '<leader>w', ':bd<CR>', opts)
set_keymap('n', '<leader>q', ':bd!<CR>', opts)
--switch buffer
set_keymap('n', 'gt', ':bn<CR>', opts)
set_keymap('n', 'gT', ':bp<CR>', opts)
-- switch cwd
set_keymap('n', '<leader>.', ':cd %:p:h<CR>', opts)
-- save and quit
set_keymap('n', 'S', ':w<CR>', opts)
set_keymap('n', 'Q', ':q<CR>', opts)

-- speed neovim
set_keymap('n', '<Leader>C', ':!rm ~/.local/state/nvim/shada/main.shada<CR>', opts)


