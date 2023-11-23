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
ln -fhsv $(pwd)/emacs/emacs.el ~/.emacs.el
ln -fhsv $(pwd)/emacs/emacs.d ~/.emacs.d
ln -fhsv $(pwd)/fish/config.fish ~/.config/fish/config.fish
ln -fhsv $(pwd)/ghc ~/.ghc
ln -fhsv $(pwd)/git/gitconfig ~/.gitconfig
ln -fhsv $(pwd)/git/gitconfig_kitware ~/.gitconfig_kitware
ln -fhsv $(pwd)/git/gitconfig_personal ~/.gitconfig_personal
ln -fhsv $(pwd)/git/gitignore_global ~/.gitignore_global
ln -fhsv $(pwd)/nvim ~/.config/nvim
ln -fhsv $(pwd)/starship/starship.toml ~/.config/starship.toml
ln -fhsv $(pwd)/vim/vimrc ~/.vimrc
ln -fhsv $(pwd)/vim/gvimrc ~/.gvimrc
ln -fhsv $(pwd)/vim ~/.vim
ln -fhsv $(pwd)/zsh/zshrc ~/.zshrc

# Git config
git config --global core.excludesfile ~/.gitignore_global

if [[ "$(uname)" == "Darwin" ]]; then
    ln -fs $(pwd)/tmux/tmux_darwin.conf ~/.tmux.conf
    /bin/bash ./scripts/osx.sh
    FISH=$(which fish)
    if [ -z "$FISH" ]; then
      echo "Warning: fish shell not found"
    else
      echo "Found fish shell at $FISH"
      if [[ "$SHELL" != "$FISH" ]]; then
          if ! grep -Fxq "$FISH" /etc/shells; then
              sudo sh -c "echo $FISH >> /etc/shells"
          fi
          echo "Setting shell to $FISH"
          chsh -s $FISH
      fi
    fi
elif [[ "$(uname)" == "Linux" ]]; then
    if [[ $EUID -ne 0 ]]; then
        echo "Run as root"
        exit 1
    fi
    ln -fs ~/dotfiles/tmux_linux.conf ~/.tmux.conf
fi

echo "Done"
