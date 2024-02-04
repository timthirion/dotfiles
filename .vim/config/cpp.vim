" C++
augroup C++
autocmd!
autocmd FileType c,cpp iabbrev #i #include
autocmd FileType c,cpp iabbrev #d #define
autocmd FileType c,cpp nno <buffer> <localleader>c I//<esc>
autocmd FileType c,cpp setlocal ts=2 sts=2 sw=2
autocmd FileType c,cpp setlocal cindent
autocmd FileType c,cpp setlocal cinoptions=g0

" Better C++11 syntax highlighting
function! EnhancedCppSyntax()
  syntax clear
  runtime! syntax/cpp.vim

  syntax keyword cpp11Constant      nullptr
  syntax keyword cpp11Type          constexpr override final noexcept
  syntax keyword cpp11StorageClass  decltype
  highlight link cpp11Type          Type
  highlight link cpp11StorageClass  StorageClass
  highlight link cpp11Constant      Constant
endfunc
autocmd BufEnter *.{c,cpp,C,cc,cxx,h,hpp,hxx} call EnhancedCppSyntax()

augroup END " C++
