#!/bin/bash

#printf "\nChecking for needed utilities\n"

if ! type brew > /dev/null 2&>1; then
    #echo "Installing brew"
    ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
#else
    #echo "Found brew"
fi

brew update > /dev/null 2&>1

cmds=(\
    ack         \
    autoconf    \
    automake    \
    fish        \
    ffmpeg      \
    git         \
    python      \
    tmux        \
    tree        \
    wget        \
);

for c in ${cmds[*]}; do
    if ! type $c > /dev/null 2&>1; then
        #echo "Installing $c"
        brew install $c
    #else
        #echo "Found $c"
    fi
done
#printf "Done\n"
