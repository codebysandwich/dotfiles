function! GetVisualSelection()
    " Why is this not a built-in Vim script function?!
    let [line_start, column_start] = getpos("'<")[1:2]
    let [line_end, column_end] = getpos("'>")[1:2]
    let lines = getline(line_start, line_end)
    if len(lines) == 0
        return ''
    endif
    let lines[-1] = lines[-1][: column_end - (&selection == 'inclusive' ? 1 : 2)]
    let lines[0] = lines[0][column_start - 1:]
    return join(lines, "\n")
endfunction

" vnoremap <silent><leader>tr :<C-U>!osascript ~/.config/nvim/vim_plugin_snippets/bobscpt.scpt GetVisualSelection()<CR>
xnoremap <leader>tr <esc>:'<,'>:w !osascript ~/.config/nvim/vim_plugin_snippets/bobscpt.scpt<CR>
