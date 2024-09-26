--[[--
File              : telescope.lua
Author            : sandwich
Date              : 2023-10-08 16:20:11
Last Modified Date: 2024-04-16 09:25:19
Last Modified By  : sandwich
--]]
--
return {
	-- {
	--     'nvim-lua/plenary.nvim',
	--     -- event='VeryLazy'
	--     keys = {'<leader>f', mode='n'}
	-- },
	{
		'nvim-telescope/telescope.nvim',
		branch = '0.1.x',
		keys = {
			{ '<leader>fl', "<cmd>lua require('telescope.builtin').help_tags()<CR>",  mode = 'n' },
			{ '<leader>fk', "<cmd>lua require('telescope.builtin').keymaps()<CR>",    mode = 'n' },
			{ '<leader>fb', "<cmd>lua require('telescope.builtin').buffers()<CR>",    mode = 'n' },
			{ '<leader>ft', "<cmd>lua require('telescope.builtin').treesitter()<CR>", mode = 'n' },
			{ '<leader>fh', "<cmd>lua require('telescope.builtin').oldfiles()<CR>",   mode = 'n' },
			{ '<leader>ff', "<cmd>lua require('telescope.builtin').find_files()<CR>", mode = 'n' },
			{ '<leader>fa', "<cmd>lua require('telescope.builtin').live_grep()<CR>",  mode = 'n' },
			{ '<leader>fm', "<cmd>lua require('telescope.builtin').marks()<CR>",      mode = 'n' },
		},
		-- cmd = 'Telescope find_files',
		dependencies = { 'nvim-lua/plenary.nvim' },
		-- config = function()
		--     require('telescope').setup {
		opts = {
			defaults = {
				prompt_prefix = " ",
				selection_caret = " ",
				path_display = { "smart" },
				-- initial_mode = "normal",
			},
		}

		-- local builtin = require('telescope.builtin')
		-- local opts = { noremap = true, silent = true }
		-- vim.keymap.set('n', '<leader>fl', builtin.help_tags, opts)
		-- vim.keymap.set('n', '<leader>fk', builtin.keymaps, opts)
		-- vim.keymap.set('n', '<leader>fb', builtin.buffers, opts)
		-- vim.keymap.set('n', '<leader>ft', builtin.treesitter, opts)
		-- vim.keymap.set('n', '<leader>fh', builtin.oldfiles, opts)
		-- vim.keymap.set('n', '<leader>ff', builtin.find_files, opts)
		-- vim.keymap.set('n', '<leader>fa', builtin.live_grep, opts)
		-- vim.keymap.set('n', '<leader>fm', builtin.marks, opts)
		-- end
	}
}
