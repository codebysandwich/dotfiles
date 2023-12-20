--[[--
File              : lazy.lua
Author            : sandwich
Date              : 2023-10-31 11:36:13
Last Modified Date: 2023-12-04 14:54:13
Last Modified By  : sandwich
--]]
--  _
-- | |    __ _ _____   _
-- | |   / _` |_  / | | |
-- | |__| (_| |/ /| |_| |
-- |_____\__,_/___|\__, |
--                 |___/

-- lazy boot_strap
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
	spec = {
		{ import = "plugins" },
	},
	default = { lazy = true },
	performance = {
		cache = {
			enabled = true,
			-- disable_events = {},
		},
		rtp = {
			disabled_plugins = {
				"gzip",
				"matchit",
				"matchparen",
				"netrwPlugin",
				"rplugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
	ui = {
		size = { width = 0.85, height = 0.85 },
		border = 'rounded',
		icons = {
			cmd = "󰆍 ",
			config = " ",
			event = "",
			start = "󰼛",
		},
	}
})
