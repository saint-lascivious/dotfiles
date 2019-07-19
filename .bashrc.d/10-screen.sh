#!/bin/bash

# Launch screen and set the term value to 'screen'
#[[ $TERM != "screen" ]] && exec screen -q

# Restore DISPLAY and SSH_AUTH_SOCK if we saved those before
# entering this screen session.
if [ -n "$STY" ]; then
    export DISPLAY=`cat ~/.screen/.current_display`
    export SSH_AUTH_SOCK=`cat ~/.screen/.current_ssh_auth_sock`
fi