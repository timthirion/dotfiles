#!/bin/bash

if [ ! -d ~/.config ]; then
    mkdir ~/.config
    mkdir ~/.config/fish
fi

#git pull -q origin master > /dev/null
#git submodule init -q
#git submodule update -q

rm -f ~/.vimrc
rm -f ~/.gvimrc
rm -rf ~/.vim
rm -f ~/.emacs.el
rm -rf ~/.emacs.d
rm -f ~/.zshrc
rm -f ~/.config/fish/config.fish
rm -f ~/.tmux.conf
rm -rf ~/.ghc
rm -f ~/.gitconfig
rm -f ~/.gitignore_global

ln -s ~/dotfiles/vimrc ~/.vimrc
ln -s ~/dotfiles/gvimrc ~/.gvimrc
ln -s ~/dotfiles/vim ~/.vim
ln -s ~/dotfiles/emacs.el ~/.emacs.el
ln -s ~/dotfiles/emacs.d ~/.emacs.d
ln -s ~/dotfiles/zshrc ~/.zshrc
ln -s ~/dotfiles/config.fish ~/.config/fish/config.fish
ln -s ~/dotfiles/ghc ~/.ghc
ln -s ~/dotfiles/gitconfig ~/.gitconfig
ln -s ~/dotfiles/gitignore_global ~/.gitignore_global

git config --global core.excludesfile ~/.gitignore_global

#ln -s ~/dotfiles/clang_complete/* ~/dotfiles/vim/.

if [[ "$(uname)" == "Darwin" ]]; then
    ln -s ~/dotfiles/tmux_darwin.conf ~/.tmux.conf
    /bin/bash ./osx
    #/bin/bash ./brew_installs.sh
    if [[ "$SHELL" != "/usr/local/bin/fish" ]]; then
        if ! grep -Fxq "/usr/local/bin/fish" /etc/shells; then
            sudo sh -c "echo /usr/local/bin/fish >> /etc/shells"
        fi
        chsh -s /usr/local/bin/fish
    fi
elif [[ "$(uname)" == "Linux" ]]; then
    if [[ $EUID -ne 0 ]]; then
        echo "Run as root"
        exit 1
    fi
    ln -s ~/dotfiles/tmux_linux.conf ~/.tmux.conf
    #/bin/bash ./aptget_installs.sh
fi

rm -rf 1
