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
