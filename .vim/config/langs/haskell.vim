" Haskell
augroup Haskell
  autocmd!
  autocmd FileType haskell setlocal ts=8 sts=4 sw=4
  autocmd FileType haskell setlocal expandtab smarttab shiftround nojoinspaces
  autocmd FileType haskell nno <buffer> <localleader>c I--<esc>
augroup END
