--[[--
File              : bqf.lua
Author            : sandwich
Date              : 2023-09-25 13:53:18
Last Modified Date: 2024-02-20 20:29:09
Last Modified By  : sandwich
--]]
--
return {
	{
		'kevinhwang91/nvim-bqf',
		ft = 'qf',
		config = function()
			local fn = vim.fn
			local cmd = vim.cmd

			cmd([[
				hi BqfPreviewBorder guifg=#50a14f ctermfg=71
				hi link BqfPreviewRange Search
			]])

			-- https://github.com/neoclide/coc.nvim
			-- if you use coc-fzf, you should disable its CocLocationsChange event
			-- to make bqf work for <Plug>(coc-references)

			cmd([[
				nnoremap <silent> <leader>qd <Cmd>lua _G.diagnostic()<CR>
				autocmd FileType qf nnoremap <silent><buffer> <CR> <CR>:cclose<CR>:lclose<CR>
			]])


			-- autocmd BufNewFile,BufRead *.qf unmap <silent><buffer> <CR>
			-- just use `_G` prefix as a global function for a demo
			-- please use module instead in reality

			function _G.diagnostic()
				fn.CocActionAsync('diagnosticList', '', function(err, res)
					if err == vim.NIL then
						local items = {}
						for _, d in ipairs(res) do
							local text = ('[%s%s] %s'):format((d.source == '' and 'coc.nvim' or d.source),
								(d.code == vim.NIL and '' or ' ' .. d.code), d.message:match('([^\n]+)\n*'))
							local item = {
								filename = d.file,
								lnum = d.lnum,
								end_lnum = d.end_lnum,
								col = d.col,
								end_col = d.end_col,
								text = text,
								type = d.severity
							}
							table.insert(items, item)
						end
						fn.setqflist({}, ' ', { title = 'CocDiagnosticList', items = items })

						cmd('bo cope')
					end
				end)
			end

			-- you can also subscribe User `CocDiagnosticChange` event to reload your diagnostic in quickfix
			-- dynamically, enjoy yourself :)

			require('bqf').setup({
				auto_resize_height = true,
			})
		end
	},
}
