-- require('leap').add_default_mappings()
-- require('leap').init_highlight(true)

-- Search in all windows
vim.keymap.set('n', '<leader>s', function ()
  local focusable_windows_on_tabpage = vim.tbl_filter(
    function (win) return vim.api.nvim_win_get_config(win).focusable end,
    vim.api.nvim_tabpage_list_wins(0)
  )
  require('leap').leap { target_windows = focusable_windows_on_tabpage, offset=0}
end)

-- vim.api.nvim_set_hl(0, 'LeapBackdrop', { fg = 'grey' })
vim.api.nvim_set_hl(0, 'LeapLabelPrimary', { bg = '#088199', fg = 'white' })

-- vim.api.nvim_create_autocmd('User', {
--       pattern = 'LeapEnter',
--       command = 'echomsg("Leap Entered!")',
-- })
vim.api.nvim_create_autocmd('User', {
      pattern = 'LeapLeave',
      command = 'echo("Leap Leave!")',
})
