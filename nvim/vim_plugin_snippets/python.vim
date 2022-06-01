autocmd FileType python set splitbelow
" " =====
" " ----------F5运行Python----
" " =====
" "一键运行代码
" " nnoremap <F5> :!python %:p<cr>
" nnoremap <F5> :call CompileRunGcc()<cr>
" let $PYTHONUNBUFFERED=1
" func! CompileRunGcc()
"           exec "w"
"           if &filetype == 'python'
"                   if search("@profile")
"                           exec "AsyncRun kernprof -l -v %"
"                           exec "botright copen"
"                   elseif search("set_trace()")
"                           exec "!python3 %"
"                   else
"                           exec "AsyncRun -raw python3 %"
"                           exec "botright copen"
"                   endif
"           endif
" endfunc

autocmd FileType python nnoremap <leader>r :w<ESC>:sp \| resize 12 \| terminal time python3 %<Enter>G
autocmd FileType python inoremap <leader>r <ESC>:w<ESC>:sp \| resize 12 \| terminal time python3 %<Enter>G
autocmd FileType python setlocal conceallevel=1
" autocmd FileType python let g:indentLine_color_gui='#6E6761'
