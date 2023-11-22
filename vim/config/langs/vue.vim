" Vue
au! BufRead,BufNewFile *vue set filetype=vue
augroup Vue
  autocmd!
  autocmd FileType vue setlocal ts=2 sts=2 sw=2
augroup END
