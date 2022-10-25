# dotfiles
apps and tools config files

# Warning

config coc default key-mapping

config-file-path: ./nvim/plugged/coc.nvim/plugin/coc.vim

```vimscript
if empty(mapcheck("\<down>", 'i'))
  " by sandwich
  inoremap <silent><expr> <down> coc#pum#visible() ? coc#pum#next(0) : ""
endif
if empty(mapcheck("\<up>", 'i'))
  " by sandwich
  inoremap <silent><expr> <up> coc#pum#visible() ? coc#pum#prev(0) : ""
endif
```

![](https://gitee.com/codebysandwich/source/raw/master/picgo/2022-10/20221025163143.png)
