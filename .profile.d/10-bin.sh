#!/bin/bash

# Create ~/bin PATH for the user's private bin if it doesn't
# already exist.
if [ ! -d ~/bin ]; then
    mkdir -p ~/bin
fi

# Create ~/.local/bin PATH for the user's private bin if it
# doesn't already exist
if [ ! -d ~/.local/bin ]; then
    mkdir -p ~/.local/bin
fi