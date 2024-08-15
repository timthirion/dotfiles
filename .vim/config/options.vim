" Basic vim options
set backspace=indent,eol,start  " Make backspace key work good
set encoding=utf-8              " Encode UTF-8 by default
set nowrap                      " Don't wrap lines
set number numberwidth=4        " Enable line numbers (width four)
set ruler                       " Show line and column number of cursor
set scrolloff=3                 " Scroll three lines before top/bottom of view
set showcmd                     " Display incomplete commands
set title                       " Display the file name in the window title
set ttyfast                     " Indicate fast terminal connection

" UI options
set guioptions-=m               " Remove the menu bar
set guioptions-=T               " Remove the toolbar
set guioptions-=L               " Remove the left vertical scroll
set guioptions-=r               " Remove the right vertical scroll

" Folding
set foldenable                  " Enable folding
set foldlevel=99                " Don't close any folds when a file is opened
set foldmethod=syntax           " Fold lines according to source type

" Searching
set hlsearch                    " Enable search highlighting
set incsearch                   " Enable incremental search
set ignorecase                  " Ignore case when searching
set smartcase                   " ... Except when at least one capital

" Whitespace
set textwidth=120               " 120 character text width
set expandtab                   " Expand tabs to spaces
set shiftwidth=2                " Indent = two spaces
set tabstop=2                   " Tab indent = two spaces
set smartindent                 " Indent intelligently
set list                        " Show whitespace chars (next line)
set listchars=tab:▸\ ,trail:·,extends:❯,precedes:❮ " Don't render newline
"set listchars=tab:▸\ ,eol:↩,trail:·,extends:❯,precedes:❮ " Render newlines
hi NonText ctermfg=8 guifg=gray
hi SpecialKey ctermfg=8 guifg=gray
