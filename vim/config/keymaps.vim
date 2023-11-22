" Use arrow keys to navigate splits
nnoremap <left> <C-w><C-h>
nnoremap <down> <C-w><C-j>
nnoremap <up> <C-w><C-k>
nnoremap <right> <C-w><C-l>

" Escape is too far away
inoremap jk <esc>
inoremap <esc> <nop>
cnoremap jk <esc>
cnoremap <esc> <nop>

" Jump to end/beginning of line
nnoremap H ^
nnoremap L $

" Reselect visual block after indent/outdent -- vimbits.com
vnoremap < <gv
vnoremap > >gv

" Make Y behave like other capitals
map Y y$

" Clear all highlights after incremental search
nnoremap <CR> :noh<CR><CR>

" Shortcut to expand scoping braces properly
autocmd FileType c,cpp,objc,objcpp,cs,cuda,java,javascript,rust
  \ ino <buffer> {{ {<CR>}<ESC><Up>o
