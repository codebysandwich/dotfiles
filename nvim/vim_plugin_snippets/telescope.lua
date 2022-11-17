-- " Find files using Telescope command-line sugar.
-- " nnoremap <leader>fb <cmd>Telescope buffers<cr>
-- " nnoremap <leader>fl <cmd>Telescope help_tags<cr>
-- " nnoremap <leader>fk <cmd>Telescope keymaps<cr>
-- " nnoremap <leader>ft <cmd>Telescope treesitter<cr>

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
    }
}

local builtin = require('telescope.builtin')
local opts = {noremap = true, silent = true}
vim.keymap.set('n', '<leader>fl', builtin.help_tags, opts)
vim.keymap.set('n', '<leader>fk', builtin.keymaps, opts)
vim.keymap.set('n', '<leader>fb', builtin.buffers, opts)
vim.keymap.set('n', '<leader>ft', builtin.treesitter, opts)
