local status_ok, _ = pcall(require, "bufferline")
local get_color = require'lualine.utils.utils'.extract_highlight_colors
if not status_ok then
	vim.notify("bufferline not found!")
end

require("bufferline").setup{
	options = {
		show_buffer_close_icons = false,
		show_close_icon = false,
	},
	highlights = {
		fill = {
			-- guibg = '#21252C',
			guibg = get_color('Normal', 'bg')
		},
		indicator_selected = {
			guifg = '#98C379',
		},
		buffer_selected = {
			-- guibg = '#FF424C',
			-- TabLineSel = {
			--     bg = '#FF424C'
			-- },
		},
		separator = {
			guibg = get_color('Normal', 'bg'),
			-- guifg = get_color('Normal', 'bg')
		},
		background = {
			guibg = get_color('Normal', 'bg')
		},
		modified = {
			guibg = get_color('Normal', 'bg')
		}
	},
} 

-- vim.cmd([[hi TabLineSel guibg=#FF424C]])
