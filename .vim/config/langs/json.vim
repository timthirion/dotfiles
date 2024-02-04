" JSON
au! BufRead,BufNewFile *json set filetype=json
augroup JSON
  autocmd!
  autocmd FileType json setlocal ts=2 sts=2 sw=2
augroup END
