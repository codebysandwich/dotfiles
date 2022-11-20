local status_ok, indent_blankline = pcall(require, "indent_blankline")
if not status_ok then
	return
end

vim.opt.list = false
-- vim.opt.listchars:append "space:⋅"
-- vim.opt.listchars:append "eol:↴"
vim.g.indent_blankline_use_treesitter = false
vim.g.indent_blankline_strict_tabs = true
vim.g.indent_blankline_show_trailing_blankline_indent = false
vim.g.indent_blankline_enabled = false
vim.g.indent_blankline_buftype_exclude = { "terminal", "nofile" }
vim.g.indent_blankline_filetype_exclude = {
	"lspinfo",
	"packer",
	"checkhealth",
	"help",
	"man",
	"dashboard",
	"coc-explorer",
}
-- vim.cmd [[highlight IndentBlanklineChar guifg=#3D4350 gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineContextChar gui=nocombine guifg=#FFFB00]]
-- !! wried TODO
-- vim.cmd [[highlight IndentBlanklineContextStart guisp=#fb4934 gui=underline cterm=underline]]

require("indent_blankline").setup {
	char = "▏",
	-- space_char_blankline = " ",
	show_current_context = true,
	show_current_context_start = true,
}


-- keymap
local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<leader>T", "<Cmd>IndentBlanklineToggle<CR>", opts)
