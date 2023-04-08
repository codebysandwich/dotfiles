return {
	{
		'rrethy/vim-hexokinase',
		build = 'make hexokinase',
		cmd = 'HexokinaseToggle'
	},
	{
		'jiangmiao/auto-pairs', 
	},
	{'honza/vim-snippets', event='InsertEnter'},
	{'wakatime/vim-wakatime', event='InsertEnter'},
	{
		'gcmt/wildfire.vim',
		keys = {{'<space>', mode='n'}},
		init = function()
			vim.cmd([[
			let g:wildfire_objects = ["i'", 'i"', "i)", "i]", "i}", 
						 \"ip", "it", "i>", "i`"]
			" fix disable enter in quickfix
			let g:wildfire_fuel_map = get(g:, "wildfire_fuel_map", "<SPACE>")
			]])
		end
	},
	{'tpope/vim-surround'},
	{'godlygeek/tabular', event='CmdlineEnter'},
	{
		'kshenoy/vim-signature', 
		event = 'VeryLazy',
	},
	{
		'alpertuna/vim-header',
		cmd = 'AddHeader',
		init = function()
			vim.cmd([[
			autocmd BufNewFile,BufRead *.py,*.go,*.cpp,*.c,*h,*.java silent! AddHeader
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
			{'<leader>c<space>', mode={'n', 'x'}},
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
			{'<C-j>', mode='n'},
			{'<C-k>', mode='n'},
			{'<C-n>', mode='n'},
		},
		init = function()
			vim.cmd([[
			let g:VM_maps = {}
			let g:VM_maps["Add Cursor Down"]    = '<C-j>'   " new cursor down
			let g:VM_maps["Add Cursor Up"]      = '<C-k>'   " new cursor up
			]])
		end,
	},
	{
		'easymotion/vim-easymotion',
		keys = {{'<leader>s', mode='n'}, {'<leader>S', mode='n'}},
		config = function()
			vim.cmd([[
			let g:EasyMotion_add_search_history = 0
			nnoremap <leader>S <Plug>(easymotion-overwin-f2)
			nnoremap <leader>s <Plug>(easymotion-sn)
			" vim-easymotion disturbs diagnostics
			autocmd User EasyMotionPromptBegin silent! CocDisable
			autocmd User EasyMotionPromptEnd silent! CocEnable
			autocmd User EasyMotionPromptBegin silent! Gitsigns toggle_signs
			autocmd User EasyMotionPromptEnd silent! Gitsigns toggle_signs
			]])
		end
	},
	{
		'ybian/smartim',
		keys = {{ '<esc>', mode={'i'}}},
		config = function()
			vim.cmd([[
			let g:smartim_default = 'com.apple.keylayout.ABC'
			]])
		end
	},
	{
		'folke/zen-mode.nvim', cmd='ZenMode',
		keys = {{'<leader>z', mode='n', desc='zenmode'}},
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
		keys = {{ 'ra',  mode='n' }},
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
			let g:rnvimr_presets = [{'width': 0.8, 'height': 0.8}]
			]])
		end
	}
}
