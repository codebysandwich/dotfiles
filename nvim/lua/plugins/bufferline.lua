--[[--
File              : bufferline.lua
Author            : sandwich
Date              : 2023-10-31 10:05:33
Last Modified Date: 2023-12-18 15:45:57
Last Modified By  : sandwich
--]]
--
return {
	{
		'akinsho/bufferline.nvim',
		version = "v3.*",
		dependencies = 'nvim-tree/nvim-web-devicons',
		-- event = { 'BufEnter', },
		event = { 'VeryLazy', },
		config = function()
			local function get_color(color_group, scope)
				if vim.fn.hlexists(color_group) == 0 then
					return nil
				end
				local color = vim.api.nvim_get_hl_by_name(color_group, true)
				if color.background ~= nil then
					color.bg = string.format('#%06x', color.background)
					color.background = nil
				end
				if color.foreground ~= nil then
					color.fg = string.format('#%06x', color.foreground)
					color.foreground = nil
				end
				if color.special ~= nil then
					color.sp = string.format('#%06x', color.special)
					color.special = nil
				end
				if scope then
					return color[scope]
				end
				return color
			end
			-- local get_color = require'lualine.utils.utils'.extract_highlight_colors
			require("bufferline").setup {
				options = {
					show_buffer_close_icons = false,
					show_close_icon = false,
					indicator = {
						icon = '▍', -- this should be omitted if indicator style is not 'icon'
					},
					offsets = {
						{
							filetype = "NvimTree",
							text = function()
								local foldername = vim.fn.expand('%:p:h:t')
								return "  " .. foldername
							end,
							highlight = "Function",
							text_align = "left",
							separator = false,
						}
					},
				},
				highlights = {
					fill = {
						bg = get_color('Normal', 'bg'),
						-- guibg = '#21252C',
					},
					indicator_selected = {
						fg = '#98C379',
					},
					buffer_selected = {
						-- guibg = '#FF424C',
						-- TabLineSel = {
						--     bg = '#FF424C'
						-- },
					},
					separator = {
						bg = get_color('Normal', 'bg'),
						-- fg = get_color('Normal', 'bg')
					},
					background = {
						bg = get_color('Normal', 'bg')
					},
					modified = {
						bg = get_color('Normal', 'bg')
					}
				},
			}
		end
	},
}
