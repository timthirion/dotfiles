#!/bin/bash

#echo "Deleting old config files"
rm -f ~/.vimrc
rm -rf ~/.vim
rm -f ~/.zshrc
rm -f ~/.config/fish/config.fish
rm -f ~/.tmux.conf
rm -rf ~/.ghc
rm -f ~/.gitconfig
rm -f ~/.gitignore_global
#printf "Done\n\n"

#echo "Symlinking config files"
ln -s ~/dotfiles/vimrc ~/.vimrc
ln -s ~/dotfiles/vim ~/.vim
ln -s ~/dotfiles/zshrc ~/.zshrc
ln -s ~/dotfiles/config.fish ~/.config/fish/config.fish
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/ghc ~/.ghc
ln -s ~/dotfiles/gitconfig ~/.gitconfig
ln -s ~/dotfiles/gitignore_global ~/.gitignore_global

git config --global core.excludesfile ~/.gitignore_global

#printf "Done\n"

# OS X
if [[ "$(uname)" == "Darwin" ]]; then
    chmod +x ./osx
    /bin/bash ./osx
    /bin/bash ./brew_installs.sh
fi

#printf "\n"
#echo "All done!"
