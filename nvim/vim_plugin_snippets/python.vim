autocmd FileType python set splitbelow
autocmd FileType python nnoremap <leader>r :w<ESC>:sp \| resize 12 \| terminal time python3 %<Enter>G
autocmd FileType python inoremap <leader>r <ESC>:w<ESC>:sp \| resize 12 \| terminal time python3 %<Enter>G

" autocmd FileType python setlocal conceallevel=1
" autocmd FileType python let g:indentLine_color_gui='#6E6761'
