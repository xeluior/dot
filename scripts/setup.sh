#!/usr/bin/env bash

function setup() {
  src=$1
  dst=$2

  ln -si "$src" "$dst"
}

modbash_init () {
  # use a subshell with my XDG_* vars defined
  BASH_ENV="$PWD/profile" bash -c 'git clone https://github.com/xeluior/modbash.git "$XDG_DATA_HOME/modbash"'
}

function main() {
  setup "${PWD}/profile" "${HOME}/.profile"
  setup "${PWD}/bashrc" "${HOME}/.bashrc"
  for f in "${PWD}/config/"*; do
    setup "$f" "${XDG_CONFIG_HOME:-"${HOME}/.config"}"
  done
}

main
