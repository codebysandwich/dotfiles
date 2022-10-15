autocmd FileType cpp set splitbelow
autocmd FileType cpp nnoremap <leader>r :w<ESC>:!clang++ % -o %:r<Enter><ESC>
							  \:sp \| resize 12 \| terminal time ./%:r<Enter>G
autocmd FileType cpp inoremap <leader>r <ESC>:w<ESC>:!clang++ % -o %:r<Enter><ESC>
							  \:sp \| resize 12 \| terminal time ./%:r<Enter>G
