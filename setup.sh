#!/bin/bash

# Silent pushd & popd
pushd () {
    command pushd "$@" > /dev/null
}
popd () {
    command popd "$@" > /dev/null
}

if [ ! -d ~/.config ]; then
    mkdir -p ~/.config/fish
fi

# Set symbolic links for all dotfiles and folders
echo "Setting symbolic links"
ln -fhsv $(pwd)/vimrc ~/.vimrc
ln -fhsv $(pwd)/gvimrc ~/.gvimrc
ln -fhsv $(pwd)/vim ~/.vim
ln -fhsv $(pwd)/emacs.el ~/.emacs.el
ln -fhsv $(pwd)/emacs.d ~/.emacs.d
ln -fhsv $(pwd)/zshrc ~/.zshrc
ln -fhsv $(pwd)/config.fish ~/.config/fish/config.fish
ln -fhsv $(pwd)/ghc ~/.ghc
ln -fhsv $(pwd)/gitconfig ~/.gitconfig
ln -fhsv $(pwd)/gitconfig_kitware ~/.gitconfig_kitware
ln -fhsv $(pwd)/gitconfig_personal ~/.gitconfig_personal
ln -fhsv $(pwd)/gitignore_global ~/.gitignore_global
ln -fhsv $(pwd)/starship.toml ~/.config/starship.toml

# Git config
git config --global core.excludesfile ~/.gitignore_global

# vim plugins
echo "Checking vim plugins"
[ ! -d vim/bundle ] && mkdir -p vim/bundle
pushd vim/bundle

[ ! -d ctrlp.vim ]            && git clone -q git@github.com:ctrlpvim/ctrlp.vim
[ ! -d rust.vim ]             && git clone -q git@github.com:rust-lang/rust.vim
[ ! -d vim-airline ]          && git clone -q git@github.com:vim-airline/vim-airline
[ ! -d vim-expand-region ]    && git clone -q git@github.com:terryma/vim-expand-region
[ ! -d vim-fugitive ]         && git clone -q git@github.com:tpope/vim-fugitive
[ ! -d vim-commentary ]       && git clone -q git@github.com:tpope/vim-commentary
[ ! -d vim-surround ]         && git clone -q git@github.com:tpope/vim-surround

# themes
[ ! -d base16-vim ]           && git clone -q git@github.com:chriskempson/base16-vim
[ ! -d gruvbox ]              && git clone -q git@github.com:morhetz/gruvbox
[ ! -d papercolor-theme ]     && git clone -q git@github.com:NLKNguyen/papercolor-theme
[ ! -d vim-colors-solarized ] && git clone -q git@github.com:altercation/vim-colors-solarized
popd

echo "Setting shell"
if [[ "$(uname)" == "Darwin" ]]; then
    ln -fs ~/dotfiles/tmux_darwin.conf ~/.tmux.conf
    /bin/bash ./osx.sh
    if [[ "$SHELL" != "/opt/homebrew/bin/fish" ]]; then
        if ! grep -Fxq "/opt/homebrew/bin/fish" /etc/shells; then
            sudo sh -c "echo /opt/homebrew/bin/fish >> /etc/shells"
        fi
        chsh -s /opt/homebrew/bin/fish
    fi
elif [[ "$(uname)" == "Linux" ]]; then
    if [[ $EUID -ne 0 ]]; then
        echo "Run as root"
        exit 1
    fi
    ln -fs ~/dotfiles/tmux_linux.conf ~/.tmux.conf
fi

echo "Done"
