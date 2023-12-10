#!/usr/bin/bash

function setup() {
  src=$1
  dst=$2

  ln -si "$src" "$dst"
}

function main() {
  setup "${PWD}/profile" "${HOME}/.profile"
  setup "${PWD}/bashrc" "${HOME}/.bashrc"
  setup "${PWD}/bash_profile" "${HOME}/.bash_profile"
  for f in "${PWD}/config/"*; do
    setup "$f" "${HOME}/.config"
  done
}

main
