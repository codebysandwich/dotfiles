" =====
" --------- coc --------------
" =====
" 自动安装的管理部分
let g:coc_global_extensions=['coc-json', 'coc-vimlsp', 'coc-pairs', 'coc-explorer', 
							\'coc-snippets', 'coc-go', 'coc-marketplace', 'coc-yank', 
							\'coc-pyright']
set hidden
set nobackup
set nowritebackup
set updatetime=100
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

set signcolumn=yes

inoremap <silent><expr> <TAB>
	  \ coc#pum#visible() ? coc#pum#next(1) :
	  \ CheckBackspace() ? "\<Tab>" :
	  \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
							  \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

nnoremap <silent> <LEADER>h :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
	call CocActionAsync('doHover')
  else
	call feedkeys('K', 'in')
  endif
endfunction

" 设置函数签名触发
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
autocmd CursorHoldI,CursorMovedI * silent call CocActionAsync('showSignatureHelp')

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
" Symbol renaming.
nmap rn <Plug>(coc-rename)

nmap <leader>f :call CocActionAsync('format')<CR>
" =====
" ----------coc-go----------
" =====
autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')
" =====
" coc-snippets
" =====
" let g:coc_snippet_next = '<c-l>'
" let g:coc_snippet_prev = '<c-k>'
" autocmd BufRead,BufNewFile tsconfig.json set filetype=jsonc
" coc-explorer
nmap tt :CocCommand explorer<CR>
" =====
" ----------coc-yank----------
" =====
nnoremap <silent> <LEADER>y  :<C-u>CocList -A --normal yank<cr>
" =====
" ----------coc-action----------
" =====
nmap <silent> ga <Plug>(coc-codeaction-line)
xmap <silent> ga <Plug>(coc-codeaction-selected)
nmap <silent> gA <Plug>(coc-codeaction)

" =====
" ----------fix coc-java jdt.ls new buffer can not jdt start----------
" =====
autocmd BufNewFile *.java silent write
autocmd BufNewFile *.java silent CocRestart
