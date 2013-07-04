echo "Deleting old files"
rm ~/.vimrc
rm -rf ~/.vim
rm ~/.zshrc
rm -rf ~/.ghc
rm ~/.osx
rm ~/.gitconfig
rm ~/.gitignore_global

echo "Copying files"
ln -sv ~/dotfiles/vimrc ~/.vimrc
ln -sv ~/dotfiles/vim ~/.vim
ln -sv ~/dotfiles/zshrc ~/.zshrc
ln -sv ~/dotfiles/ghc ~/.ghc
ln -sv ~/dotfiles/osx ~/.osx
ln -sv ~/dotfiles/gitconfig ~/.gitconfig
ln -sv ~/dotfiles/gitignore_global ~/.gitignore_global

echo "Done"
