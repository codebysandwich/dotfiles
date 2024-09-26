--[[--
File              : toggleterm.lua
Author            : sandwich
Date              : 2024-02-17 18:49:46
Last Modified Date: 2024-02-20 20:59:00
Last Modified By  : sandwich
--]]
--
return {
	{
		'akinsho/toggleterm.nvim',
		version = '*',
		keys = { { '<C-\\>', mode = 'n' }, { '<leader>g', mode = 'n' }, { '<leader>j', mode = 'n' } },
		config = function()
			require('toggleterm').setup({
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
				on_open = function(terminal)
					local nvimtree = require "nvim-tree.api"
					local nvimtree_view = require "nvim-tree.view"
					if nvimtree_view.is_visible() and terminal.direction == "horizontal" then
						-- local nvimtree_width = vim.fn.winwidth(nvimtree_view.get_winnr())
						-- nvimtree.tree.toggle()
						-- nvimtree_view.View.width = nvimtree_width
						nvimtree.tree.toggle(false, true)
						nvimtree.tree.toggle(false, true)
					end
				end
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

			local opts = { noremap = true, silent = true }
			vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)
			vim.api.nvim_set_keymap("n", "<leader>j", "<cmd>ToggleTerm direction=horizontal size=20<CR>", opts)
			vim.api.nvim_set_keymap("t", "<leader>j", "<cmd>ToggleTerm direction=horizontal size=20<CR>", opts)
		end
	}
}
