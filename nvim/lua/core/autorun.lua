--              _
--   __ _  ___ | |_ ___  _ __ _   _ _ __
--  / _` |/ _ \| __/ _ \| '__| | | | '_ \
-- | (_| | (_) | || (_) | |  | |_| | | | |
--  \__,_|\___/ \__\___/|_|   \__,_|_| |_|

vim.cmd([[
autocmd FileType python,go,cpp,c,java set splitbelow
" =====
" ----------python----------
" =====
autocmd FileType python nnoremap <leader>r :w<ESC>:sp \| resize 12 \| terminal time python3 %<Enter>G
autocmd FileType python inoremap <leader>r <ESC>:w<ESC>:sp \| resize 12 \| terminal time python3 %<Enter>G
" =====
" ----------markdown----------
" =====
autocmd FileType markdown inoremap ,f <Esc>/<++><CR>:nohlsearch<CR>c4l
autocmd FileType markdown inoremap ,b ****<++><Esc>F*hi
autocmd FileType markdown inoremap ,s ~~~~<++><Esc>F~hi
autocmd FileType markdown inoremap ,i **<++><Esc>F*i
autocmd FileType markdown inoremap ,d ``<++><Esc>F`i
autocmd FileType markdown inoremap ,c ```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA
autocmd FileType markdown inoremap ,h ====<Space><++><Esc>F=hi
autocmd FileType markdown inoremap ,p ![](<++>) <++><Esc>F]i
autocmd FileType markdown inoremap ,a [](<++>) <++><Esc>F[a
autocmd FileType markdown inoremap ,k <kbd></kbd><++><Esc>F/hi
autocmd FileType markdown inoremap ,1 #<Space><Enter><++><Esc>kA
autocmd FileType markdown inoremap ,2 ##<Space><Enter><++><Esc>kA
autocmd FileType markdown inoremap ,3 ###<Space><Enter><++><Esc>kA
autocmd FileType markdown inoremap ,4 ####<Space><Enter><++><Esc>kA
" ---------syntax highlight-----------
autocmd FileType markdown syn match markdownError "\w\@<=\w\@="
autocmd FileType markdown nnoremap <LEADER>m :MarkdownPreview<CR>
" =====
" ----------go----------
" =====
autocmd FileType go nnoremap <leader>r :w<ESC>:sp \| resize 12 \| terminal time go run %<Enter>G
autocmd FileType go inoremap <leader>r <ESC>:w<ESC>:sp \| resize 12 \| terminal time go run %<Enter>G
" =====
" ----------cpp----------
" =====
autocmd FileType cpp nnoremap <leader>r :w<ESC>:!clang++ % -o %:r<Enter><ESC>
							  \:sp \| resize 12 \| terminal time ./%:r<Enter>G
autocmd FileType cpp inoremap <leader>r <ESC>:w<ESC>:!clang++ % -o %:r<Enter><ESC>
							  \:sp \| resize 12 \| terminal time ./%:r<Enter>G
" =====
" ----------c----------
" =====
autocmd FileType c nnoremap <leader>r :w<ESC>:!clang % -o %:r<Enter><ESC>
							\:sp \| resize 12 \| terminal time ./%:r<Enter>G
autocmd FileType c inoremap <leader>r <ESC>:w<ESC>:!clang % -o %:r<Enter><ESC>
							\:sp \| resize 12 \| terminal time ./%:r<Enter>G
" =====
" ----------java----------
" =====
" src 为sourcepath 资源路径 out 为编译输出路径
autocmd FileType java nnoremap <leader>r :w<ESC>:!javac -sourcepath src -d out %<Enter><ESC>
			\:sp \| resize 12 \| terminal w=%:.:r;c=${w\#*/};time java -cp out $c<Enter>G

autocmd FileType java inoremap <leader>r <ESC>:w<ESC>:!javac -sourcepath src -d out %<Enter><ESC>
			\:sp \| resize 12 \| terminal w=%:.:r;c=${w\#*/};time java -cp out $c<Enter>G
]])
