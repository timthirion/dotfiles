" Makefiles
augroup Make
  autocmd!
  autocmd FileType make setlocal noexpandtab
  autocmd FileType make nno <buffer> <localleader>c I#<esc>
augroup END
