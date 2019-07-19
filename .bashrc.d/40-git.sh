#!/bin/bash

# Manage our git config file location.
NEW_CONFIG=~/.config/git/config
OLD_CONFIG=~/.gitconfig

# If ~/.gitconfig does not yet exist create a symbolic link.
# ~/.config/git/gitconfig
if [ ! -e "$OLD_CONFIG" ]; then
    ln -s "$NEW_CONFIG" "$OLD_CONFIG"
else
# If ~/.gitconfig does exist and is not a symbolic link, assume
# the user wants to keep it and copy it to ~/.config/git/gitconfig
# before creating the symbolic link.
    if [ ! -h "$OLD_CONFIG" ]; then
        mv "$OLD_CONFIG" "$NEW_CONFIG"
        ln -s "$NEW_CONFIG" "$OLD_CONFIG"
    fi
fi