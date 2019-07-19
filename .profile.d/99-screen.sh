#!/bin/bash

# Create a new screen if that's what we're supposed to be doing.
if [ -n "$CREATE_SCREEN_LATER" ]; then
    exec screen -S $SCREEN_SESSION -U
fi