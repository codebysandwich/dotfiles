--[[--
File              : ui.lua
Author            : sandwich
Date              : 2023-09-25 13:03:22
Last Modified Date: 2024-07-22 10:06:39
Last Modified By  : sandwich
--]]
--
return {
	{
		'codebysandwich/nvim-deus',
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[
			colorscheme deus
			hi CursorLineNr guifg=#FECB6B
			]])
		end,
	},
	-- {
	--     "folke/tokyonight.nvim",
	--     lazy = false, -- make sure we load this during startup if it is your main colorscheme
	--     priority = 1000, -- make sure to load this before all the other start plugins
	--     config = function()
	--         require("tokyonight").setup({
	--             -- style = "night",
	--             styles = {
	--                 -- Style to be applied to different syntax groups
	--                 -- Value is any valid attr-list value for `:help nvim_set_hl`
	--                 comments = { italic = false },
	--                 keywords = { italic = false },
	--             },
	--         })
	--         -- load the colorscheme here
	--         vim.cmd([[
	--         colorscheme tokyonight
	--         hi CursorLineNr guifg=#FECB6B
	--         hi! link @preproc Comment
	--         ]])
	--     end,
	-- },
	-- {
	--     "rmehri01/onenord.nvim",
	--     branch = "main",
	--     config = function()
	--         require('onenord').setup({
	--             borders = false,
	--             theme = "dark",
	--         })
	--         vim.cmd([[
	--         colorscheme onenord
	--         hi! link @preproc Comment
	--         hi CursorLineNr guifg=#FECB6B
	--         ]])
	--     end,
	-- },
	{
		-- WARN: test
		-- NOTE: test
		-- TODO: test
		-- HACK: test
		-- PERF: test
		-- FIX: test
		'folke/todo-comments.nvim',
		event = 'VeryLazy',
		dependencies = { 'nvim-lua/plenary.nvim' },
		opts = {
			keywords = {
				FIX = {
					alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
				},
				TODO = { icon = " ", color = "warning" },
				HACK = { icon = " ", color = "info" },
				WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
			},
			highlight = {
				multiline = false,
			}
		}
	}
}
