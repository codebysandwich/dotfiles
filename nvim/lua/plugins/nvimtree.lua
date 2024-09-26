--[[--
File              : nvimtree.lua
Author            : sandwich
Date              : 2023-09-25 10:37:48
Last Modified Date: 2024-07-27 17:56:00
Last Modified By  : sandwich
--]]
--
return {
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		keys = { { '<leader>t', mode = 'n' } },
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
			vim.cmd [[
				:hi NvimTreeSpecialFile guifg=#ff80ff
			]]
			local function my_on_attach(bufnr)
				local api = require "nvim-tree.api"

				local function opts(desc)
					return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
				end

				-- default mappings
				api.config.mappings.default_on_attach(bufnr)

				-- NOTE: custom mappings
				vim.keymap.set('n', 'i', api.node.show_info_popup, opts('Info'))
			end
			-- Go to last used hidden buffer when deleting a buffer
			vim.api.nvim_create_autocmd("BufEnter", {
				nested = true,
				callback = function()
					local api = require('nvim-tree.api')

					-- Only 1 window with nvim-tree left: we probably closed a file buffer
					if #vim.api.nvim_list_wins() == 1 and api.tree.is_tree_buf() then
						-- Required to let the close event complete. An error is thrown without this.
						vim.defer_fn(function()
							-- close nvim-tree: will go to the last hidden buffer used before closing
							api.tree.toggle({ find_file = true, focus = true })
							-- re-open nivm-tree
							api.tree.toggle({ find_file = true, focus = true })
							-- nvim-tree is still the active window. Go to the previous window.
							vim.cmd("wincmd p")
						end, 0)
					end
				end
			})
			vim.api.nvim_create_autocmd("QuitPre", {
				callback = function()
					local invalid_win = {}
					local wins = vim.api.nvim_list_wins()
					for _, w in ipairs(wins) do
						local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
						if bufname:match("NvimTree_") ~= nil then
							table.insert(invalid_win, w)
						end
					end
					if #invalid_win == #wins - 1 then
						-- Should quit, so we close all invalid windows.
						for _, w in ipairs(invalid_win) do vim.api.nvim_win_close(w, true) end
					end
				end
			})

			-- empty setup using defaults
			require("nvim-tree").setup {
				disable_netrw = false,
				on_attach = my_on_attach,
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
						git_placement = "after",
						glyphs = {
							git = {
								untracked = '󱣩',
								-- untracked = '?',
								deleted = '✘',
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
				view = {
					preserve_window_proportions = true,
				},
			}
			-- keymap
			local opts = { noremap = true, silent = true }
			vim.api.nvim_set_keymap("n", "<leader>t", "<Cmd>NvimTreeToggle<CR>", opts)
		end
	}
}
