--[[--
File              : treesitter.lua
Author            : sandwich
Date              : 2023-10-27 11:52:59
Last Modified Date: 2024-09-26 16:39:25
Last Modified By  : sandwich
--]]
--
return {
	{
		'nvim-treesitter/nvim-treesitter',
		build = ":TSUpdate",
		event = "VeryLazy",
		config = function()
			-- one of "all", "maintained" (parsers with maintainers), or a list of languages
			require("nvim-treesitter.configs").setup({
					ensure_installed = { "c", "cpp", "vim", "vimdoc", "query", "java", "lua", "python", "go", "rust" },
					-- ignore_install = { "javascript" }, -- List of parsers to ignore installing
					-- Install parsers synchronously (only applied to `ensure_installed`)
					sync_install = false,
					auto_install = false,
					highlight = {
						enable = true, -- false will disable the whole extension
						-- disable = { "python", "vim" },  -- list of language that will be disabled
						-- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
						disable = function(lang, buf)
							local max_filesize = 100 * 1024 -- 100 KB
							local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
							if ok and stats and stats.size > max_filesize then
								return true
							else
								-- local ls = { "vim", "go" }
								local ls = {}
								for i = 0, #ls do
									if ls[i] == lang then
										return true
									end
								end
							end
						end,

						-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
						-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
						-- Using this option may slow down your editor, and you may see some duplicate highlights.
						-- Instead of true it can also be a list of languages
						additional_vim_regex_highlighting = false,
					},
					rainbow = {
						enable = true,
						-- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
						extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
						max_file_lines = nil, -- Do not enable for files with more than n lines, int
						colors = { '#E06C75', '#E5C07B', '#56B6C2',
							'#61AFEF', '#C678DD', '#d65d0e',
							'#458588', }, -- table of hex strings
						termcolors = {} -- table of colour name strings
					},
					indent = {
						enable = true
					},
					incremental_selection = {
						enable = true,
						keymaps = {
							init_selection = "<CR>",
							node_decremental = "<BS>",
							node_incremental = "<CR>",
							scope_incremental = "<TAB>"
						},
					}
				},
				-- WARN: set brefore will coflict with VeryLazy
				vim.cmd([[
				set foldmethod=indent
				set foldmethod=expr
				set foldexpr=nvim_treesitter#foldexpr()
				]])
			)
		end
	},
	{
		'p00f/nvim-ts-rainbow',
		keys = { { '<leader>cr', "<cmd>TSEnable rainbow<CR>", mode = 'n' } }
		-- event = 'BufRead'
	},
	{
		'nvim-treesitter/playground',
		cmd = { "TSPlaygroundToggle", 'TSHighlightCapturesUnderCursor' },
		dependencies = 'nvim-treesitter/nvim-treesitter',
	},
}
