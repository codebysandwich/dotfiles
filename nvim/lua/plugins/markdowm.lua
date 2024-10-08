--[[--
File              : markdowm.lua
Author            : sandwich
Date              : 2024-03-10 12:21:08
Last Modified Date: 2024-03-10 12:50:54
Last Modified By  : sandwich
--]]
--
return {
	{
		'iamcco/markdown-preview.nvim',
		build = 'cd app && yarn install',
		ft = 'markdown',
		config = function()
			vim.cmd([[
			let g:mkdp_browser='chromium'
			let g:mkdp_auto_start = 0
			]])
		end
	},
	{
		'mzlogin/vim-markdown-toc',
		ft = 'markdown',
		config = function()
			vim.cmd [[
			let g:vmt_fence_text = 'TOC'
			let g:vmt_fence_closing_text = '/TOC'
			let g:vmt_fence_hidden_markdown_style = 'GFM'
			]]
		end
	},
	{
		'dhruvasagar/vim-table-mode',
		ft = 'markdown',
		init = function()
			vim.cmd([[
			nnoremap tt <Plug>(table-mode-tableize)
			xnoremap tt <Plug>(table-mode-tableize)
			autocmd BufNewFile,BufRead *.md silent! unmap <leader>tm
			nnoremap tm :TableModeToggle<CR>
			]])
		end,
		config = function()
			vim.cmd([[
			let g:table_mode_corner = '|'
			let g:table_mode_border=0
			let g:table_mode_fillchar=' '

			function! s:isAtStartOfLine(mapping)
			  let text_before_cursor = getline('.')[0 : col('.')-1]
			  let mapping_pattern = '\V' . escape(a:mapping, '\')
			  let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
			  return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
			endfunction

			inoreabbrev <expr> <bar><bar>
					  \ <SID>isAtStartOfLine('\|\|') ?
					  \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
			inoreabbrev <expr> __
					  \ <SID>isAtStartOfLine('__') ?
					  \ '<c-o>:silent! TableModeDisable<cr>' : '__'
			]])
		end
	},
}
