--[[--
File              : tools.lua
Author            : sandwich
Date              : 2023-06-25 16:46:07
Last Modified Date: 2024-04-19 10:50:54
Last Modified By  : sandwich
--]]
return {
	{
		'rrethy/vim-hexokinase',
		build = 'make hexokinase',
		cmd = 'HexokinaseToggle'
	},
	-- {
	--     'jiangmiao/auto-pairs',
	--     event = 'BufRead'
	-- },
	{
		'windwp/nvim-autopairs',
		event = "InsertEnter",
		config = function()
			local npairs = require("nvim-autopairs")
			local Rule = require('nvim-autopairs.rule')
			local cond = require("nvim-autopairs.conds")
			npairs.setup({
				map_cr = false,
				enable_abbr = true,
				fast_wrap = {
					map = '<M-e>',
					chars = { '{', '[', '(', '"', "'" },
					pattern = [=[[%'%"%>%]%)%}%,]]=],
					end_key = '$',
					before_key = 'h',
					after_key = 'l',
					cursor_pos_before = true,
					keys = 'qwertyuiopzxcvbnmasdfghjkl',
					manual_position = true,
					highlight = 'Search',
					highlight_grey = 'Comment'
				}
			})
			npairs.add_rules({
				Rule(" ", " ")
					:with_pair(cond.done())
					:replace_endpair(function(opts)
						local pair = opts.line:sub(opts.col - 1, opts.col)
						if vim.tbl_contains({ "()", "{}", "[]" }, pair) then
							return " " -- it return space here
						end
						return "" -- return empty
					end)
					:with_move(cond.none())
					:with_cr(cond.none())
					:with_del(function(opts)
						local col = vim.api.nvim_win_get_cursor(0)[2]
						local context = opts.line:sub(col - 1, col + 2)
						return vim.tbl_contains({ "(  )", "{  }", "[  ]" }, context)
					end)
			})
		end
	},
	{ 'honza/vim-snippets',    event = 'InsertEnter' },
	{ 'wakatime/vim-wakatime', event = 'InsertEnter' },
	-- {
	--     'gcmt/wildfire.vim',
	--     keys = {{'<space>', mode='n'}},
	--     init = function()
	--         vim.cmd([[
	--         let g:wildfire_objects = ["i'", 'i"', "i)", "i]", "i}",
	--                      \"ip", "it", "i>", "i`"]
	--         " fix disable enter in quickfix
	--         let g:wildfire_fuel_map = get(g:, "wildfire_fuel_map", "<SPACE>")
	--         ]])
	--     end
	-- },
	{
		'tpope/vim-surround',
		event = 'VeryLazy',
	},
	{ 'godlygeek/tabular', event = 'CmdlineEnter' },
	{
		'kshenoy/vim-signature',
		event = 'VeryLazy',
	},
	{
		'alpertuna/vim-header',
		cmd = 'AddHeader',
		init = function()
			vim.cmd([[
			autocmd BufNewFile,BufRead *.py,*.go,*.cpp,*.c,*h,*.java,*.lua,*.rs silent! AddHeader
			]])
		end,
		config = function()
			vim.cmd([[
			let g:header_field_author = 'sandwich'
			let g:header_field_author_email = ''
			let g:header_field_timestamp_format = '%Y-%m-%d %H:%M:%S'
			let g:header_auto_add_header = 0
			let g:header_auto_update_header = 1
			]])
		end
	},
	{
		'preservim/nerdcommenter',
		keys = {
			{ '<leader>c<space>', mode = { 'n', 'x' } },
		},
		config = function()
			vim.cmd([[
			let g:NERDCustomDelimiters = {"vim": {"left": "\" "}, "lua": {"left": "-- "}}
			let g:NERDToggleCheckAllLines = 1
			let g:NERDDefaultAlign = 'left'
			]])
		end
	},
	{
		'mg979/vim-visual-multi',
		keys = {
			{ '<C-j>', mode = 'n' },
			{ '<C-k>', mode = 'n' },
			{ '<C-n>', mode = 'n' },
		},
		init = function()
			vim.cmd([[
			let g:VM_maps = {}
			let g:VM_maps["Add Cursor Down"]    = '<C-j>'   " new cursor down
			let g:VM_maps["Add Cursor Up"]      = '<C-k>'   " new cursor up
			]])
		end,
	},
	-- {
	--     'easymotion/vim-easymotion',
	--     keys = { { '<leader>s', mode = 'n' }, { '<leader>S', mode = 'n' } },
	--     config = function()
	--         vim.cmd([[
	--         let g:EasyMotion_add_search_history = 0
	--         nnoremap <leader>S <Plug>(easymotion-overwin-f2)
	--         nnoremap <leader>s <Plug>(easymotion-sn)
	--         " vim-easymotion disturbs diagnostics
	--         autocmd User EasyMotionPromptBegin silent! CocDisable
	--         autocmd User EasyMotionPromptEnd silent! CocEnable
	--         autocmd User EasyMotionPromptBegin silent! Gitsigns toggle_signs
	--         autocmd User EasyMotionPromptEnd silent! Gitsigns toggle_signs
	--         ]])
	--     end
	-- },
	{
		"folke/flash.nvim",
		opts = {
			highlight = { backdrop = false, },
			modes = {
				char = {
					jump_labels = true
				}
			},
			label = { after = false, before = true }
		},
		-- stylua: ignore
		keys = {
			{ "<leader>s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
			{
				"<leader>S",
				mode = { "n", "x", "o" },
				function() require("flash").treesitter() end,
				desc =
				"Flash Treesitter"
			},
			{
				"r",
				mode = "o",
				function() require("flash").remote() end,
				desc =
				"Remote Flash"
			},
			{
				"R",
				mode = { "o", "x" },
				function() require("flash").treesitter_search() end,
				desc =
				"Treesitter Search"
			},
			{
				"<c-s>",
				mode = { "c" },
				function() require("flash").toggle() end,
				desc =
				"Toggle Flash Search"
			},
			{ "/",         mode = { 'n' } },
			{ "f",         mode = { 'n' } },
			{ "F",         mode = { 'n' } },
		},
	},
	{
		'ybian/smartim',
		keys = { { '<esc>', mode = { 'i' } } },
		config = function()
			vim.cmd([[
			let g:smartim_default = 'com.apple.keylayout.ABC'
			]])
		end
	},
	{
		'folke/zen-mode.nvim',
		keys = { { '<leader>z', mode = 'n', desc = 'zenmode' } },
		config = function()
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
		end
	},
	{
		'kevinhwang91/rnvimr',
		keys = { { 'ra', mode = 'n' } },
		config = function()
			vim.cmd([[
			let g:rnvimr_enable_ex = 0
			let g:rnvimr_enable_picker = 1
			let g:rnvimr_draw_border = 1
			let g:rnvimr_border_attr = {'fg': 14, 'bg': -1}
			highlight link RnvimrNormal CursorLine
			let g:rnvimr_ranger_cmd = ['ranger', '--cmd=set draw_borders both']
			" nnoremap <silent> <leader><leader>r :RnvimrToggle<CR><C-\><C-n>:RnvimrResize 0<CR>
			nnoremap <silent> ra :RnvimrToggle<CR>
			let g:rnvimr_action = {
						\ '<C-t>': 'NvimEdit tabedit',
						\ '<C-x>': 'NvimEdit split',
						\ '<C-v>': 'NvimEdit vsplit',
						\ 'gw': 'JumpNvimCwd',
						\ 'yw': 'EmitRangerCwd'
						\ }
			let g:rnvimr_layout = { 'relative': 'editor',
						\ 'width': &columns,
						\ 'height': &lines,
						\ 'col': 0,
						\ 'row': 0,
						\ 'style': 'minimal' }
			let g:rnvimr_presets = [{'width': 0.85, 'height': 0.85}]
			]])
		end
	}
}
