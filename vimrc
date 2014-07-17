set nocompatible

" Color scheme & syntax highlighting
set t_Co=256
set background=dark
syntax on
colorscheme wombat

let mapleader=","
let maplocalleader="\\"

" Settings
set backspace=indent,eol,start " Make backspace key work good
set expandtab " Expand tabs to spaces
set foldenable " Enable folding
set foldlevel=99 " Don't close any folds when a file is opened
set foldmethod=syntax " Fold lines according to source type
set guioptions-=m " Remove the menu bar
set guioptions-=T " Remove the toolbar
set guioptions-=L " Remove the left vertical scroll
set guioptions-=r " Remove the right vertical scroll
set hlsearch " Enable search highlighting
set ignorecase " Ignore case when searching
set incsearch " Enable incremental search
set list " Show whitespace
set list listchars=tab:»·,trail:· " Format whitespace display
set noswapfile " Disable swap files
set number numberwidth=4 " Enable line numbers (width four)
set ruler " Show line and column number of cursor
set scrolloff=3 " Scroll three lines before top/bottom of view
set shiftwidth=2 " Indent = two spaces
set smartcase " Ignore ignorecase option when search string has uppercase
set smartindent " Indent intelligently
set tabstop=2 " Tab indent = two spaces
set textwidth=80 " Set text width at 80 characters
set title " Display the file name in the window title
set ttyfast " Indicate fast terminal connection

" Hardcore mode
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>
inoremap jk <esc>
inoremap <esc> <nop>
cnoremap jk <esc>
cnoremap <esc> <nop>
vnoremap v <esc>
vnoremap <esc> <nop>

" Useful remappings
nnoremap H ^
nnoremap L $

" Clear all highlights after incremental search
nnoremap <CR> :noh<CR><CR>

" Word processor mode
func! WordProcessorMode()
    setlocal formatoptions=1
    setlocal noexpandtab
    setlocal spell spelllang=en_us
    set complete+=s
    set formatprg=par
    setlocal wrap
    setlocal linebreak
endfu
com! WP call WordProcessorMode()

" C++
augroup C++
autocmd!
autocmd FileType c,cpp iabbrev #i #include
autocmd FileType c,cpp iabbrev #d #define
autocmd FileType c,cpp nno <buffer> <localleader>c I//<esc>
autocmd FileType c,cpp setlocal sw=2 ts=2
augroup END

" Haskell
augroup Haskell
autocmd!
autocmd FileType haskell setlocal ts=8 sts=4 sw=4
autocmd FileType haskell setlocal expandtab smarttab shiftround nojoinspaces
autocmd FileType haskell nno <buffer> <localleader>c I--<esc>
augroup END

" HTML
augroup HTML
autocmd!
autocmd FileType html setlocal sw=2 ts=2 nowrap
autocmd BufWritePre,BufRead *.html :normal gg=G
augroup END

" Javascript
augroup JavaScript
autocmd!
autocmd FileType javascript nno <buffer> <localleader>c I//<esc>
augroup END

" Makefiles
augroup Make
autocmd!
autocmd FileType make setlocal noexpandtab
autocmd FileType make nno <buffer> <localleader>c I#<esc>
augroup END

" Markdown
augroup Markdown
autocmd!
autocmd FileType markdown setlocal syntax=off
augroup END

" Python
augroup python
autocmd!
autocmd FileType python setlocal ts=4 sts=4 sw=4 smarttab
autocmd FileType python nnoremap <buffer> <localleader>c I//<esc>
augroup END

" Windows-specific settings
if has("win32") || has("win16")
    autocmdGUIEnter * simalt ~x
    set gfn=Consolas:h12:cANSI
    source $VIMRUNTIME/vimrc_example.vim
    source $VIMRUNTIME/mswin.vim
    behave mswin
endif

