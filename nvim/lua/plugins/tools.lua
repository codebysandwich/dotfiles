return {
	{
		'rrethy/vim-hexokinase',
		build = 'make hexokinase',
		cmd = 'HexokinaseToggle'
	},
	{'jiangmiao/auto-pairs'},
	{'honza/vim-snippets'},
	{'wakatime/vim-wakatime'},
	{
		'gcmt/wildfire.vim',
	},
	{'tpope/vim-surround'},
	{'godlygeek/tabular'},
	{'kshenoy/vim-signature'},
	{
		'alpertuna/vim-header',
		cmd = 'AddHeader',
		config = function()
			vim.cmd([[
			let g:header_field_author = 'sandwich'
			let g:header_field_author_email = ''
			let g:header_field_timestamp_format = '%Y-%m-%d %H:%M:%S'
			let g:header_auto_add_header = 0
			let g:header_auto_update_header = 1
			autocmd BufNewFile,BufRead *.py,*.go,*.cpp,*.c,*h,*.java silent! AddHeader
			]])
		end
	},
	{
		'preservim/nerdcommenter',
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
		config = function()
			vim.cmd([[
			map <C-j> <Plug>(VM-Add-Cursor-Down)
			map <C-k> <Plug>(VM-Add-Cursor-Up)
			]])
		end
	},
	{
		'easymotion/vim-easymotion',
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
		config = function()
			vim.cmd([[
			let g:smartim_default = 'com.apple.keylayout.ABC'
			]])
		end
	},
	{
		'folke/zen-mode.nvim', cmd='ZenMode',
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
