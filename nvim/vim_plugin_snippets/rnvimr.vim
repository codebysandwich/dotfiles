let g:rnvimr_ex_enable = 1
let g:rnvimr_pick_enable = 1
let g:rnvimr_draw_border = 1
let g:rnvimr_border_attr = {'fg': 14, 'bg': -1}
highlight link RnvimrNormal CursorLine
let g:rnvimr_ranger_cmd = ['ranger', '--cmd=set draw_borders both']
" nnoremap <silent> <leader><leader>r :RnvimrToggle<CR><C-\><C-n>:RnvimrResize 0<CR>
nnoremap <silent> <leader><leader>r :RnvimrToggle<CR>
let g:rnvimr_action = {
            \ '<C-t>': 'NvimEdit tabedit',
            \ '<C-x>': 'NvimEdit split',
            \ '<C-v>': 'NvimEdit vsplit',
            \ 'gw': 'JumpNvimCwd',
            \ 'yw': 'EmitRangerCwd'
            \ }
let g:rnvimr_layout = { 'relative': 'editor',
            \ 'width': &columns,
            \ 'height': &lines,
            \ 'col': 0,
            \ 'row': 0,
            \ 'style': 'minimal' }
let g:rnvimr_presets = [{'width': 0.8, 'height': 0.8}]
