--[[--
File              : indent.lua
Author            : sandwich
Date              : 2023-09-25 14:54:39
Last Modified Date: 2023-11-30 16:20:43
Last Modified By  : sandwich
--]]
--
return {
	{
		'lukas-reineke/indent-blankline.nvim',
		main = "ibl",
		keys = { { '<leader>T', mode = 'n' } },
		config = function()
			require("ibl").setup {
				enabled = false,
				indent = { char = "▏", highlight = "IndentBlanklineChar" },
				scope = { show_end = false, highlight = "IndentBlanklineContextChar" },
				exclude = {
					filetypes = {
						"lspinfo",
						"packer",
						"checkhealth",
						"help",
						"man",
						"gitcommit",
						"TelescopePrompt",
						"TelescopeResults",
						"dashboard",
						"coc-explorer",
						"vista",
						"NvimTree",
					}
				}
			}
			-- keymap
			local opts = { noremap = true, silent = true }
			vim.api.nvim_set_keymap("n", "<leader>T", "<Cmd>IBLToggle<CR>", opts)
			-- highlight
			vim.cmd [[highlight IndentBlanklineChar guifg=#3D4350 gui=nocombine]]
			vim.cmd [[highlight IndentBlanklineContextChar gui=nocombine guifg=#73ba9f]]
			--  TODO: iterm2 underline
			-- vim.cmd [[highlight IndentBlanklineContextStart guisp=#fb4934 gui=underline]]
		end
	},
	{
		'lukas-reineke/virt-column.nvim',
		-- keys = {{'<leader>T', mode='n'}},
		event = 'CmdlineEnter',
		init = function()
			vim.cmd([[hi VirtColumn guifg=#3D4350 guibg=none]])
		end,
		config = true
	},
}
