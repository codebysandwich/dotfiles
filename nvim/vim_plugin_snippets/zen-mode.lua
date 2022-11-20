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

-- keymap
local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<leader>z", "<Cmd>ZenMode<CR>", opts)
