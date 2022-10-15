autocmd FileType java set splitbelow
" autocmd FileType java nnoremap <leader>r :w<ESC>:!javac %<Enter><ESC>:sp \| resize 12 \| terminal time java %:r<Enter>G
" autocmd FileType java inoremap <leader>r <ESC>:w<ESC>:!javac %<Enter><ESC>:sp \| resize 12 \| terminal time java %:r<Enter>


" src 为sourcepath 资源路径 out 为编译输出路径
autocmd FileType java nnoremap <leader>r :w<ESC>:!javac -sourcepath src -d out %<Enter><ESC>
			\:sp \| resize 12 \| terminal w=%:.:r;c=${w\#*/};time java -cp out $c<Enter>G

autocmd FileType java inoremap <leader>r <ESC>:w<ESC>:!javac -sourcepath src -d out %<Enter><ESC>
			\:sp \| resize 12 \| terminal w=%:.:r;c=${w\#*/};time java -cp out $c<Enter>G

