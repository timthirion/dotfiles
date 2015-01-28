#!/bin/bash

#printf "\nChecking for needed utilities\n"

if ! type pip > /dev/null 2&>1; then
    echo "Please install python first"

    # Don't run arbitrary shell scripts from the web
    #ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
#else
    #echo "Found brew"
fi

cmds=(\
    csvkit  \
    skll    \
);

for c in ${cmds[*]}; do
    if ! type $c > /dev/null 2&>1; then
        #echo "Installing $c"
        pip install $c
    #else
        #echo "Found $c"
    fi
done

#printf "Done\n"
