#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

if ! type apt-get > /dev/null; then
  echo "apt-get not found"
  exit 1
fi

apt-get update > /dev/null

cmds=(\
  ack-grep    \
  autoconf    \
  automake    \
  fish        \
  git         \
  python      \
  tmux        \
  tree        \
  wget        \
  vim         \
);
for c in ${cmds[*]}; do
  if ! type $c > /dev/null; then
    apt-get -yqq install $c
  fi
done

packages=(\
  libav-tools     \
  mesa-common-dev \
);
for p in ${packages[*]}; do
  apt-get -yqq install $p
done

easies=(\
  mercurial \
);
for e in ${easies[*]}; do
  easy_install -q $e
done
