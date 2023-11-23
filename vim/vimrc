set nocompatible

" Load all the plugins
" Neovim has a different package manager, so it loads its own set.
if !has('nvim')
  call plug#begin('~/.vim/plugged')
  " Functional
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'rust-lang/rust.vim'
  Plug 'terryma/vim-expand-region'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-surround'
  Plug 'vim-airline/vim-airline'
  " Themes
  Plug 'chriskempson/base16-vim'
  Plug 'morhetz/gruvbox'
  Plug 'NLKNguyen/papercolor-theme'
  Plug 'altercation/vim-colors-solarized'
  Plug 'catppuccin/vim', { 'as': 'catppuccin' }
  call plug#end()
endif

" General vim config
runtime config/airline.vim
runtime config/backups.vim
runtime config/colors.vim
runtime config/cursors.vim
runtime config/copypasta.vim
runtime config/leader.vim
runtime config/options.vim
runtime config/keymaps.vim
runtime config/status.vim
runtime config/wp.vim

" Settings for specific languages
runtime config/langs/cpp.vim
runtime config/langs/go.vim
runtime config/langs/haskell.vim
runtime config/langs/html.vim
runtime config/langs/javascript.vim
runtime config/langs/json.vim
runtime config/langs/makefiles.vim
runtime config/langs/markdown.vim
runtime config/langs/python.vim
runtime config/langs/vue.vim
