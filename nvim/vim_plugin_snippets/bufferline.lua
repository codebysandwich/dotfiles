local status_ok, _ = pcall(require, "bufferline")
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
			guibg = '#21252C',
		},
		indicator_selected = {
			guifg = '#98C379',
		},
		buffer_selected = {
			-- guibg = '#FF424C',
			-- TabLineSel = {
			--     bg = '#FF424C'
			-- },
		}
	},
} 

vim.cmd([[hi TabLineSel guibg=#FF424C]])
