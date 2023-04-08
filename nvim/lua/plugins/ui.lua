return {
	{
		'codebysandwich/nvim-deus',
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[
			colorscheme deus
			syntax enable
			syntax on
			hi CursorLineNr guifg=#FECB6B
			]])
		end,
	},
	{
		'nvim-tree/nvim-web-devicons',
	},
	{
		-- WARN: test
		-- NOTE: test
		-- TODO: test
		-- HACK: test
		-- PERF: test
		-- FIX: test
		'folke/todo-comments.nvim',
		event = 'VimEnter',
		dependencies = { 'nvim-lua/plenary.nvim' },
		opts = {
			keywords = {
				TODO = { icon = " ", color = "warning" },
				HACK = { icon = " ", color = "info" },
				WARN = {icon = " ", color = "warning", alt = { "WARNING", "XXX" }},
			},
			highlight = {
				multiline = false,
			}
		}
	}
}
