--[[--
File              : autorun.lua
Author            : sandwich
Date              : 2023-10-25 14:01:13
Last Modified Date: 2025-10-15 21:07:20
Last Modified By  : sandwich
--]]
--
--              _
--   __ _  ___ | |_ ___  _ __ _   _ _ __
--  / _` |/ _ \| __/ _ \| '__| | | | '_ \
-- | (_| | (_) | || (_) | |  | |_| | | | |
--  \__,_|\___/ \__\___/|_|   \__,_|_| |_|

vim.cmd([[
" disable auto add comment to newline
autocmd FileType * set formatoptions-=cro
autocmd FileType python,go,cpp,c,java,lua,swift set splitbelow
" =====
" ----------json----------
" =====
" set json file comment
autocmd FileType json set filetype=jsonc
" =====
" ----------python----------
" =====
autocmd FileType python nnoremap <leader>r :w<ESC>:sp \| resize 12 \| terminal time python3 %<Enter>G
autocmd FileType python inoremap <leader>r <ESC>:w<ESC>:sp \| resize 12 \| terminal time python3 %<Enter>G
" =====
" ----------lua----------
" =====
autocmd FileType lua nnoremap <leader>r :w<ESC>:sp \| resize 12 \| terminal time lua %<Enter>G
autocmd FileType lua inoremap <leader>r <ESC>:w<ESC>:sp \| resize 12 \| terminal time lua %<Enter>G
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
							  \:sp \| resize 12 \| terminal time %:r<Enter>G
autocmd FileType cpp inoremap <leader>r <ESC>:w<ESC>:!clang++ % -o %:r<Enter><ESC>
							  \:sp \| resize 12 \| terminal time %:r<Enter>G
autocmd FileType cpp nnoremap <leader>b :w<ESC>:CMakeBuild<Enter>
autocmd FileType cpp nnoremap <leader>R :w<ESC>:CMakeRunCurrentFile<Enter>
" =====
" ----------c----------
" =====
autocmd FileType c nnoremap <leader>r :w<ESC>:!clang % -o %:r<Enter><ESC>
							\:sp \| resize 12 \| terminal time %:r<Enter>G
autocmd FileType c inoremap <leader>r <ESC>:w<ESC>:!clang % -o %:r<Enter><ESC>
							\:sp \| resize 12 \| terminal time %:r<Enter>G
" =====
" ----------java----------
" =====
" src 为sourcepath 资源路径 out 为编译输出路径
autocmd FileType java nnoremap <leader>r :w<ESC>:!javac -sourcepath src -d out %<Enter><ESC>
			\:sp \| resize 12 \| terminal w=%:.:r;c=${w\#*/};time java -cp out $c<Enter>G

autocmd FileType java inoremap <leader>r <ESC>:w<ESC>:!javac -sourcepath src -d out %<Enter><ESC>
			\:sp \| resize 12 \| terminal w=%:.:r;c=${w\#*/};time java -cp out $c<Enter>G
" =====
" ----------swift----------
" =====
autocmd FileType swift nnoremap <leader>r :w<ESC>:sp \| resize 12 \| terminal time swift %<Enter>G
autocmd FileType swift inoremap <leader>r <ESC>:w<ESC>:sp \| resize 12 \| terminal time swift %<Enter>G
" =====
" ----------rust----------
" =====
autocmd FileType rust nnoremap <leader>r :w<ESC>:CocCommand rust-analyzer.run<Enter><C-w>j

" =====
" ----------close terminal bottom----------
" =====
nnoremap <leader><ESC> <C-w>j:q!<Enter>
]])
