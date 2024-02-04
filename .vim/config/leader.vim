let mapleader="\<Space>"

" Open/save quickly
nnoremap <Leader>o :CtrlP<CR>
nnoremap <Leader>w :w<CR>

" Copypasta in visual mode
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" Jump to end of copypasta
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" Region expanding
vmap V <Plug>(expand_region_expand)
vmap <C-V> <Plug>(expand_region_shrink)

" Leader +[-,\] to split panes
nnoremap <Leader>- :sp<CR>
nnoremap <Leader>\ :vsp<CR>

" Buffer management
nnoremap <Leader>l :ls<CR>
nnoremap <Leader>c :bd<CR>
nnoremap <Leader>b :bp<CR>
nnoremap <Leader>g :bn<CR>
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>
