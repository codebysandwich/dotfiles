let g:dashboard_custom_header = [
\ '',
\ '',
\ '',
\ ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
\ ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
\ ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
\ ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
\ ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
\ ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
\ '',
\ '',
\ '',
\ '',
\]

" let g:dashboard_preview_command="cat"
" let g:dashboard_preview_file="~/.config/nvim/vim_plugin_snippets/asc.cat"
" let g:dashboard_preview_pipeline="lolcat"
" let g:dashboard_preview_file_width=80
" let g:dashboard_preview_file_height=12
"


let g:dashboard_custom_shortcut={
  \ 'last_session' : 'SPC s l',
  \ 'find_history' : 'SPC f h',
  \ 'find_file' : 'SPC f f',
  \ 'new_file' : 'SPC c n',
  \ 'change_colorscheme' : 'SPC t c',
  \ 'find_word' : 'SPC f a',
  \ 'book_marks' : 'SPC f m',
  \ }
nnoremap <silent> <Leader>fh :DashboardFindHistory<CR>
nnoremap <silent> <Leader>ff :DashboardFindFile<CR>
nnoremap <silent> <Leader>tc :DashboardChangeColorscheme<CR>
nnoremap <silent> <Leader>fa :DashboardFindWord<CR>
nnoremap <silent> <Leader>fm :DashboardJumpMark<CR>
nnoremap <silent> <Leader>cn :DashboardNewFile<CR>
