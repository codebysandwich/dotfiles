return {
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		keys = {{'<leader>t', mode='n'}},
		init = function()
			local function open_nvim_tree(data)

				-- buffer is a directory
				local directory = vim.fn.isdirectory(data.file) == 1

				if not directory then
					return
				end

				-- change to the directory
				vim.cmd.cd(data.file)

				-- open the tree
				require("nvim-tree.api").tree.open()
			end
			vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
		end,
		config = function()
			-- examples for your init.lua

			-- disable netrw at the very start of your init.lua (strongly advised)
			vim.g.loaded_netrw = 1
			vim.g.loaded_netrwPlugin = 1

			-- empty setup using defaults
			require("nvim-tree").setup{
				disable_netrw = false,
				view = {
					mappings = {
						list = {
							{ key = "i", action = "toggle_file_info" },
							-- { key = "<space>", action = "preview" }, -- will enused in extended keys
						},
					},
				},
				git = {
					enable = true,
					ignore = false,
					show_on_dirs = true,
					timeout = 400,
				},
				diagnostics = {
					enable = true,
					show_on_dirs = true,
				},
				renderer = {
					highlight_opened_files = "name",
					indent_markers = {
					  enable = true,
					},
					icons = {
						glyphs = {
							git = {
								untracked = '',
								deleted = '',
							},
						},
					},
				},
				actions = {
					file_popup = {
						open_win_config = {
							border = "none",
						},
					},
				},
				-- disable open folder actived
				hijack_directories = {
					enable = true,
					auto_open = true,
				},
			}
			-- keymap
			local opts = { noremap = true, silent = true }
			vim.api.nvim_set_keymap("n", "<leader>t", "<Cmd>NvimTreeToggle<CR>", opts)
		end
	}
}
