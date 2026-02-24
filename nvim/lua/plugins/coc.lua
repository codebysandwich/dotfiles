--[[--
File              : coc.lua
Author            : sandwich
Date              : 2023-09-25 15:12:59
Last Modified Date: 2025-07-11 10:06:45
Last Modified By  : sandwich
--]]
--
return {
	{
		'neoclide/coc.nvim',
		branch = 'release',
		-- event = 'VeryLazy',
		event = 'InsertEnter',
		init = function()
			vim.cmd([[
			inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
										  \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
			]])
		end,
		config = function()
			vim.cmd([[
			let g:coc_global_extensions=['coc-json', 'coc-vimlsp', 'coc-snippets', 'coc-go',
							\'coc-marketplace', 'coc-yank',
							\'coc-pyright']

			" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

			inoremap <silent><expr> <TAB>
				  \ coc#pum#visible() ? coc#pum#next(1) :
				  \ CheckBackspace() ? "\<Tab>" :
				  \ coc#refresh()
			inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

			function! CheckBackspace() abort
			  let col = col('.') - 1
			  return !col || getline('.')[col - 1]  =~# '\s'
			endfunction

			nnoremap <silent> <leader>h :call ShowDocumentation()<CR>

			function! ShowDocumentation()
			  if CocAction('hasProvider', 'hover')
				call CocActionAsync('doHover')
			  else
				call feedkeys('K', 'in')
			  endif
			endfunction

			" Highlight the symbol and its references when holding the cursor.
			autocmd CursorHold * silent call CocActionAsync('highlight')
			highlight CocHighlightText guibg=#414859
			highlight CocFadeOut guifg=gray

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
			let g:coc_snippet_next = '<c-n>'
			let g:coc_snippet_prev = '<c-p>'
			autocmd BufRead,BufNewFile coc-settings.json set filetype=jsonc
			" coc-explorer
			" nmap <leader>t :CocCommand explorer<CR>
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
			" ----must start with project------
			" =====
			autocmd BufNewFile *.java silent write
			autocmd BufNewFile *.java silent CocRestart
			" =====
			" ----------coc#terminal----------
			" =====
			let g:coc_terminal_height=12
			" autocmd User CocTerminalOpen :resize 12
			]])
		end
	}
}
