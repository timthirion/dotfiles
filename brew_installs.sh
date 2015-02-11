#!/bin/bash

#printf "\nChecking for needed utilities\n"

if ! type brew > /dev/null 2&>1; then
    echo "Please install brew first"

    # Don't run arbitrary shell scripts from the web
    #ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
#else
    #echo "Found brew"
fi

brew update > /dev/null 2&>1

cmds=(\
    ack         \
    autoconf    \
    automake    \
    coreutils   \
    erlang      \
    fish        \
    ffmpeg      \
    git         \
    hg          \
    jq          \
    npm         \
    parallel    \
    python      \
    sbcl        \
    screenfetch \
    tig         \
    tmux        \
    tree        \
    w3m         \
    wget        \
    libtiff     \
);

for c in ${cmds[*]}; do
    if ! type $c > /dev/null 2&>1; then
        #echo "Installing $c"
        brew install $c
    #else
        #echo "Found $c"
    fi
done

# Install ImageMagick separately so we can add libtiff
brew install imagemagick --with-libtiff

# Upgrade everything
brew upgrade

#printf "Done\n"
