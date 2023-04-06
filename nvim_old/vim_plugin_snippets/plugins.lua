local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{'codebysandwich/nvim-deus', event = 'VimEnter'},
	{'nvim-tree/nvim-web-devicons', event = 'VimEnter'},
	{
		  'glepnir/dashboard-nvim',
		  event = 'VimEnter',
		  dependencies = { {'nvim-tree/nvim-web-devicons'} }
	},
	{
		'nvim-treesitter/nvim-treesitter',
		build = ":TSUpdate",
		event = 'VimEnter'
	},
	'p00f/nvim-ts-rainbow',
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { {'nvim-tree/nvim-web-devicons'} },
		event = 'VimEnter'
	},
	{
		'akinsho/bufferline.nvim',
		version = "v3.*", 
		dependencies = 'nvim-tree/nvim-web-devicons',
		event = 'VimEnter'
	},
	{
		'rrethy/vim-hexokinase',
		build = 'make hexokinase',
		cmd = 'HexokinaseToggle'
	},
	{'lewis6991/gitsigns.nvim', event = 'VimEnter'},
	{'honza/vim-snippets', event = 'VimEnter'},
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		event = 'VimEnter'
	},
	{
		'neoclide/coc.nvim',
		branch = 'release',
		event = 'VimEnter'
	},
	{
		'kevinhwang91/nvim-bqf',
		ft = 'qf'
	},
	{'wakatime/vim-wakatime', event = 'VimEnter'},
	{'preservim/nerdcommenter', event = 'VimEnter'},
	{'lukas-reineke/indent-blankline.nvim', cmd = 'IndentBlanklineToggle', event = 'VimEnter'},
	{'lukas-reineke/virt-column.nvim', event = 'VimEnter'},
	{
		'iamcco/markdown-preview.nvim',
		build = 'cd app && yarn install',
		ft = 'markdown'
	},
	{
		'mzlogin/vim-markdown-toc',
		ft = 'markdown'
	},
	{
		'dhruvasagar/vim-table-mode',
		ft = 'markdown'
	},
	{'nvim-lua/plenary.nvim', event = 'VimEnter'},
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		dependencies = { 'nvim-lua/plenary.nvim' },
		event = 'VimEnter'
    },
	{
		'folke/todo-comments.nvim',
		dependencies = { 'nvim-lua/plenary.nvim' },
		event = 'VimEnter'
	},
	{
		'nvim-treesitter/playground',
		dependencies = 'nvim-treesitter/nvim-treesitter',
		event = 'VimEnter'
	},
	{
		'gcmt/wildfire.vim', event = 'VimEnter'
	},
	{'tpope/vim-surround', event = 'VimEnter'},
	{'godlygeek/tabular', event = 'VimEnter'},
	{'jiangmiao/auto-pairs', event = 'VimEnter'},
	{'liuchengxu/vista.vim', event = 'VimEnter'},
	{'mg979/vim-visual-multi', event = 'VimEnter'},
	{
		'alpertuna/vim-header',
		cmd = 'AddHeader'
	},
	{'kshenoy/vim-signature', event = 'VimEnter'},
	{
		'akinsho/toggleterm.nvim',
		tag = '*',
		cmd = 'ToggleTerm'
	},
	{
		'fatih/vim-go',
		build = ':GoUpdateBinaries',
		ft = 'go'
	},
	{'easymotion/vim-easymotion',event='VimEnter'},
	{
		'mattn/emmet-vim',
		ft = 'html'
	},
	{'kevinhwang91/rnvimr', event = 'VimEnter'},
	{'ybian/smartim', event = 'VimEnter'},
	{'folke/zen-mode.nvim', cmd='ZenMode', event = 'VimEnter'},
})
