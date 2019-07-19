#!/bin/bash

# *** THIS MUST RUN FIRST ***

# When entering an already-existing screen we don't want to run the regular
# profile as it will do things like source .bashrc which we don't care about,
# and things like setting locale which we want to inherit from the client for
# proper charset translation.

# Make sure the file and directory structure for $DISPLAY and $SSH_AUTH_SOCK
# is present.
if [ ! -d ~/.screen ]; then
    mkdir -p ~/.screen
fi
if [ ! -f ~/.screen/.current_display ]; then
    touch ~/.screen/.current_display
fi
if [ ! -f ~/.screen/.current_ssh_auth_sock ]; then
    touch ~/.screen/.current_ssh_auth_sock
fi

# If running bash and not in POSIX mode (to give us a trapdoor via running sh)
# and we're connected to an SSH-owned TTY.
if [ -n "$BASH_VERSION" -a -z "$POSIXLY_CORRECT" -a -n "$SSH_TTY" \
     -a "$SCREEN_SESSION" != "no" -a -x /usr/bin/screen ]; then
    # Save the 'real' DISPLAY and SSH_AUTH_SOCK we have been given from sshd so
    # we can reload them in .bashrc which makes new shells do the 'right thing'
    # instead of inheriting them from the original screen process.
    echo -n $DISPLAY > ~/.screen/.current_display
    echo -n $SSH_AUTH_SOCK > ~/.screen/.current_ssh_auth_sock

    # Explicitly specified screen(?)
    if [ -z $SCREEN_SESSION ]; then
        SCREEN_SESSION="main"
    fi

    # Check if we already have a screen.
    screen -S $SCREEN_SESSION -q -ls
    SCREENSTAT=$?
    if [ $SCREENSTAT -eq 11 ]; then
        # One session, resume without further environment magic.
        # If there are more than one, screen seems to pick arbitrarily...
        # but hey what are the odds of that?
        exec screen -x -r $SCREEN_SESSION
    elif [ $SCREENSTAT -eq 9 ]; then
        # No screen session with that name.
        # We'll create it later after processing the rest of .profile.d
        CREATE_SCREEN_LATER=1
    # Here's a fun list of things that shouldn't ever happen, but might.
    # We can't find screen.
    elif [ $SCREENSTAT -eq 10 ]; then
        echo "ERROR: Unattachable screen for some reason"
        echo "This should never happen."
    # We found too much screen.
    elif [ $SCREENSTAT -ge 12 ]; then
        echo "ERROR: Is there more than one screen?"
        echo "This should never happen."
    else
    # I don't even know.
        echo "ERROR: Screen returned some crazy Scooby Doo mystery"
        echo "machine shenanigans:"
        echo "$SCREENSTAT"
        echo "This should never happen."
    fi
    unset SCREENSTAT
fi