--[[--
File              : lazy.lua
Author            : sandwich
Date              : 2023-10-31 11:36:13
Last Modified Date: 2025-01-23 17:03:03
Last Modified By  : sandwich
--]]
--  _
-- | |    __ _ _____   _
-- | |   / _` |_  / | | |
-- | |__| (_| |/ /| |_| |
-- |_____\__,_/___|\__, |
--                 |___/

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out,                            "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- git = { url_format = "git@github.com:%s.git" }, -- ssh协议
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
		border = "rounded",
		backdrop = 60,
		icons = {
			cmd = "󰆍 ",
			config = " ",
			event = "",
			start = "󰼛",
		},
	}
})
