return {
	-- {
	--     'nvim-lua/plenary.nvim', 
	--     -- event='VeryLazy'
	--     keys = {'<leader>f', mode='n'}
	-- },
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		keys = {
			{'<leader>fl', mode='n'},
			{'<leader>fk', mode='n'},
			{'<leader>fb', mode='n'},
			{'<leader>ft', mode='n'},
			{'<leader>fh', mode='n'},
			{'<leader>ff', mode='n'},
			{'<leader>fa', mode='n'},
			{'<leader>fm', mode='n'},
		},
		cmd = 'Telescope find_files',
		dependencies = { 'nvim-lua/plenary.nvim' },
		config = function()
			require('telescope').setup {
				defaults = {
					prompt_prefix = " ",
					selection_caret = " ",
					path_display = { "smart" },
					initial_mode = "normal",
				},
			}

			local builtin = require('telescope.builtin')
			local opts = {noremap = true, silent = true}
			vim.keymap.set('n', '<leader>fl', builtin.help_tags, opts)
			vim.keymap.set('n', '<leader>fk', builtin.keymaps, opts)
			vim.keymap.set('n', '<leader>fb', builtin.buffers, opts)
			vim.keymap.set('n', '<leader>ft', builtin.treesitter, opts)
			vim.keymap.set('n', '<leader>fh', builtin.oldfiles, opts)
			vim.keymap.set('n', '<leader>ff', builtin.find_files, opts)
			vim.keymap.set('n', '<leader>fa', builtin.live_grep, opts)
			vim.keymap.set('n', '<leader>fm', builtin.marks, opts)
		end
    }
}
