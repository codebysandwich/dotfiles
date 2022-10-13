autocmd FileType java set splitbelow
autocmd FileType java nnoremap <leader>r :w<ESC>:!javac %<Enter><ESC>:sp \| resize 12 \| terminal time java %:r<Enter>G
autocmd FileType java inoremap <leader>r <ESC>:w<ESC>:!javac %<Enter><ESC>:sp \| resize 12 \| terminal time java %:r<Enter>
