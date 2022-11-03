autocmd FileType go set splitbelow
autocmd FileType go nnoremap <leader>r :w<ESC>:sp \| resize 12 \| terminal time go run %<Enter>G
autocmd FileType go inoremap <leader>r <ESC>:w<ESC>:sp \| resize 12 \| terminal time go run %<Enter>G

" autocmd FileType go setlocal conceallevel=1
" autocmd FileType go let g:indentLine_color_gui='#6E6761'
" autocmd FileType go set list lcs=tab:\┊\ 
" autocmd FileType go hi SpecialKey guifg=gray
" autocmd FileType go hi NonText guifg=#6E6761
