local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
	return
end

toggleterm.setup({
	size = 20,
	open_mapping = [[<c-\>]],
	hide_numbers = true,
	shade_filetypes = {},
	shade_terminals = true,
	shading_factor = 2,
	start_in_insert = true,
	insert_mappings = true,
	persist_size = true,
	direction = "float",
	close_on_exit = true,
	shell = vim.o.shell,
	float_opts = {
		border = "curved",
		winblend = 0,
		-- highlights = {
		--     border = "Normal",
		--     background = "Normal",
		-- },
	},
})

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

function _LAZYGIT_TOGGLE()
	lazygit:toggle()
end

local node = Terminal:new({ cmd = "node", hidden = true })

function _NODE_TOGGLE()
	node:toggle()
end

local ncdu = Terminal:new({ cmd = "ncdu", hidden = true })

function _NCDU_TOGGLE()
	ncdu:toggle()
end

local htop = Terminal:new({ cmd = "htop", hidden = true })

function _HTOP_TOGGLE()
	htop:toggle()
end

local python = Terminal:new({ cmd = "python3", hidden = true })

function _PYTHON_TOGGLE()
	python:toggle()
end

local ipython = Terminal:new({ cmd = "ipython", hidden = true })

function _IPYTHON_TOGGLE()
	ipython:toggle()
end

local bpytop = Terminal:new({ cmd = "bpytop", hidden = true })

function _BPYTOP_TOGGLE()
	bpytop:toggle()
end

local ranger = Terminal:new({ cmd = "TERM=\"screen-256color\" ranger", hidden = true })

function _RANGER_TOGGLE()
	ranger:toggle()
end

local opts = {noremap = true, silent = true}
vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>j", "<cmd>ToggleTerm direction=horizontal size=20<CR>", opts)
