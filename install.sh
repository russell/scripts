#!/bin/bash

mkdir -p ~/bin
stow --dotfiles -t "${HOME}/bin" -v bin 
