" Color scheme & syntax highlighting
set t_Co=256
set background=dark
syntax on
colorscheme wombat

let mapleader=","

" Settings
set backspace=indent,eol,start " Make backspace key work good
set expandtab " Expand tabs to spaces
set foldenable " Enable folding
set foldlevel=99 " Don't close any folds when a file is opened
set foldmethod=syntax " Fold lines according to source type
set guioptions-=m " Remove the menu bar
set guioptions-=T " Remove the toolbar
set guioptions-=r " Remove the right vertical scroll
set hlsearch " Enable search highlighting
set ignorecase " Ignore case when searching
set incsearch " Enable incremental search
set list " Show whitespace
set list listchars=tab:»·,trail:· " Format whitespace display
set nocompatible " Don't be compatible with vi
set noswapfile " Disable swap files
set number numberwidth=4 " Enable line numbers (width 4)
set ruler " Show line and column number of cursor
set scrolloff=3 " Scroll three lines before top/bottom of view
set shiftwidth=4 " Indent = 4 spaces
set smartcase " Ignore ignorecase option when search string has uppercase
set smartindent " Indent intelligently
set tabstop=4 " Tab indent = four spaces
set textwidth=80 " Set text width at 80 characters
set title " Display the file name in the window title
set ttyfast " Indicate fast terminal connection

" Hardcore mode
no <up> <nop>
no <down> <nop>
no <left> <nop>
no <right> <nop>
ino jk <esc>
ino <esc> <nop>
cno jk <esc>
cno <esc> <nop>
vno v <esc>
vno <esc> <nop>

" Useful remappings
nnoremap H 0
nnoremap L $

" Abbreviations
abbreviate #i #include
abbreviate #d #define

" Clear all highlights after incremental search
nnoremap <CR> :noh<CR><CR>

" Windows-specific settings
if has("win32") || has("win16")
	au GUIEnter * simalt ~x
	set gfn=Consolas:h12:cANSI
	source $VIMRUNTIME/vimrc_example.vim
	source $VIMRUNTIME/mswin.vim
	behave mswin
endif

