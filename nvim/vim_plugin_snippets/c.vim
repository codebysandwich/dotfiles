autocmd FileType c set splitbelow
autocmd FileType c nnoremap <leader>r :w<ESC>:!clang % -o %:r<Enter><ESC>
							\:sp \| resize 12 \| terminal time ./%:r<Enter>G
autocmd FileType c inoremap <leader>r <ESC>:w<ESC>:!clang % -o %:r<Enter><ESC>
							\:sp \| resize 12 \| terminal time ./%:r<Enter>G
