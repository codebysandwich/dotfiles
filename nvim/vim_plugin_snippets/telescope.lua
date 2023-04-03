-- " autocmd User TelescopePreviewerLoaded setlocal wrap

local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

telescope.setup {
	defaults = {
        prompt_prefix = " ",
        selection_caret = " ",
        path_display = { "smart" },
		initial_mode = "normal",
    },
}

local builtin = require('telescope.builtin')
local opts = {noremap = true, silent = true}
vim.keymap.set('n', '<leader>fl', builtin.help_tags, opts)
vim.keymap.set('n', '<leader>fk', builtin.keymaps, opts)
vim.keymap.set('n', '<leader>fb', builtin.buffers, opts)
vim.keymap.set('n', '<leader>ft', builtin.treesitter, opts)
vim.keymap.set('n', '<leader>fh', builtin.oldfiles, opts)
vim.keymap.set('n', '<leader>ff', builtin.find_files, opts)
vim.keymap.set('n', '<leader>fa', builtin.live_grep, opts)
vim.keymap.set('n', '<leader>fm', builtin.marks, opts)
