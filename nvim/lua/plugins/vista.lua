--[[--
File              : vista.lua
Author            : sandwich
Date              : 2023-10-09 09:26:05
Last Modified Date: 2024-09-26 22:11:16
Last Modified By  : sandwich
--]]
--
return {
	{
		'liuchengxu/vista.vim',
		-- cmd = 'Vista!!',
		keys = { { '<leader>v', mode = 'n' } },
		config = function()
			vim.cmd([[
			noremap <silent> <leader>v :Vista!!<CR>
			" noremap <leader>tv :silent! Vista finder fzf<CR>
			" let g:vista_fzf_preview = ['right:50%']
			" let g:vista_default_executive = 'ctags'
			let g:vista_default_executive = 'coc'
			let g:vista_close_on_jump = 1
			" let g:vista_executive_for = {
			"   \ 'cpp': 'vim_lsp',
			"   \ 'php': 'vim_lsp',
			"   \ }

			" let g:vista_ctags_cmd = {
			"       \ 'haskell': 'hasktags -x -o - -c',
			"       \ }
			let g:vista#renderer#enable_icon = 1
			let g:vista#renderer#icons = {
			\    "array": "\uea8a",
			\	 "package": "\uf487",
			\    "class": "\uf0e8",
			\    "color": "\ue22b",
			\    "constant": "\uf8fe",
			\    "default": "\uf29c",
			\    "enum": "\uf435",
			\    "enumMember": "\uf02b",
			\    "event": "\ufacd",
			\    "field": "\uf93d",
			\    "file": "\uf723",
			\    "folder": "\uf115",
			\    "function": "\u0192",
			\    "interface": "\uf417",
			\    "keyword": "\uf1de",
			\    "method": "󰆧",
			\    "module": "\uf40d",
			\    "operator": "\uf915",
			\    "property": "\ue624",
			\    "reference": "\ufa46",
			\    "snippet": "\ue60b",
			\    "struct": "\ufb44",
			\    "text": "\ue612",
			\    "typeParameter": "\uf728",
			\    "unit": "\uf475",
			\    "value": "\uf89f",
			\    "variable": "\ue71b",
			\    "map": "\ufb44",
			\    "string": "\ueb8d",
			\    "number": "󰎠",
			\    "object": "\uf248",
			\    "boolean": "",
			\  }
			let g:scrollstatus_size = 15
			let g:vista_sidebar_width = 40
			let g:tagbar_scopestrs = {
				\    'class': "\uf0e8",
				\    'const': "\uf8ff",
				\    'constant': "\uf8ff",
				\    'enum': "\uf702",
				\    'field': "\uf30b",
				\    'func': "\uf794",
				\    'function': "\uf794",
				\    'getter': "\ufab6",
				\    'implementation': "\uf776",
				\    'interface': "\uf7fe",
				\    'map': "\ufb44",
				\    'member': "\uf02b",
				\    'method': "\uf6a6",
				\    'setter': "\uf7a9",
				\    'variable': "\uf71b",
				\ }
			]])
		end
	}
}
