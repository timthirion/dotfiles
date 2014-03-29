#!/bin/bash


if ! type apt-get > /dev/null; then
    echo "apt-get not found"
    exit 1
fi

apt-get update > /dev/null

cmds=(\
    ack             \
    autoconf        \
    automake        \
    fish            \
    ffmpeg          \
    git             \
    python          \
    tmux            \
    tree            \
    wget            \
);

for c in ${cmds[*]}; do
    if ! type $c > /dev/null; then
        apt-get -yqq install $c
    fi
done


packages=(\
    mesa-common-dev \
);
for p in ${packages[*]}; do
    apt-get -yqq install $p
done
