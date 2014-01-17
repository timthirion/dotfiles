#!/bin/bash

echo "Deleting old files"
rm ~/.vimrc
rm -rf ~/.vim
rm ~/.zshrc
rm ~/.config/fish/config.fish
rm ~/.tmux.conf
rm -rf ~/.ghc
rm ~/.osx
rm ~/.gitconfig
rm ~/.gitignore_global

echo "Copying files"
ln -sv ~/dotfiles/vimrc ~/.vimrc
ln -sv ~/dotfiles/vim ~/.vim
ln -sv ~/dotfiles/zshrc ~/.zshrc
ln -sv ~/dotfiles/config.fish ~/.config/fish/config.fish
ln -sv ~/dotfiles/tmux.conf ~/.tmux.conf
ln -sv ~/dotfiles/ghc ~/.ghc
ln -sv ~/dotfiles/osx ~/.osx
ln -sv ~/dotfiles/gitconfig ~/.gitconfig
ln -sv ~/dotfiles/gitignore_global ~/.gitignore_global

git config --global core.excludesfile ~/.gitignore_global

if [[ "$(uname)" == "Darwin" ]]; then
    echo "Setting OS X defaults"
    chmod +x ~/.osx
    /bin/bash ~/.osx
fi

echo "Done"
