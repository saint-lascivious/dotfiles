#!/bin/bash

# If for some reason it doesn't already, like a first time run,
# make sure the SSH socket directory structure exists.
SOCKET_DIR=~/.ssh/sockets
if [ ! -d $SOCKET_DIR ]; then
    mkdir -p $SOCKET_DIR
fi