" =====
" ----------markdown preview----------
" =====
let g:mkdp_browser='chromium'
let g:mkdp_auto_start = 0
" =====
" ----------nerdcommenter----------
" =====
let g:NERDCustomDelimiters = {"vim": {"left": "\" "}, "lua": {"left": "-- "}}
let g:NERDToggleCheckAllLines = 1
let g:NERDDefaultAlign = 'left'
" =====
" ----------vim header----------
" =====
let g:header_field_author = 'sandwich'
let g:header_field_author_email = ''
let g:header_field_timestamp_format = '%Y-%m-%d %H:%M:%S'
let g:header_auto_add_header = 0
let g:header_auto_update_header = 1
autocmd BufNewFile,BufRead *.py,*.go,*.cpp,*.c,*h,*.java silent! AddHeader

" =====
" ----------visual-Multi----------
" =====
map <C-j> <Plug>(VM-Add-Cursor-Down)
map <C-k> <Plug>(VM-Add-Cursor-Up)
" =====
" ----------smartim----------
" =====
let g:smartim_default = 'com.apple.keylayout.ABC'
