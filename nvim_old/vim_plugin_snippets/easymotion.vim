let g:EasyMotion_add_search_history = 0
nnoremap <leader>S <Plug>(easymotion-overwin-f2)
nnoremap <leader>s <Plug>(easymotion-sn)
" vim-easymotion disturbs diagnostics
autocmd User EasyMotionPromptBegin silent! CocDisable
autocmd User EasyMotionPromptEnd silent! CocEnable
autocmd User EasyMotionPromptBegin silent! Gitsigns toggle_signs
autocmd User EasyMotionPromptEnd silent! Gitsigns toggle_signs
