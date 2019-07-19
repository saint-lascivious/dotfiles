#!/bin/bash

# Just some miscellaneous shell functions.

# Generate strong random passwords of arbitrary length.
#  - With no arguments create_passwd will produce an 8 character random
#    password.
#  - Create_passwd also accepts an integer value to produce random
#    passwords of arbitrary length (within the limits of available entropy).
create-passwd ()
{
    local i=$1
    [ "$i" == "" ] && i=8
#   Uses /dev/random as the random source - slower but 'more random'.
#    - If you want to use this then uncomment the /dev/random line
#      and comment out the /dev/urandom line.
    tr -dc A-Za-z0-9_ < /dev/random | head -c ${i} | xargs
#   Uses /dev/urandom as the random source - faster but 'less random'.
#    - If you don't want to use this then uncomment the /dev/urandom line
#      and comment out the /dev/random line.
    #tr -dc A-Za-z0-9_ < /dev/urandom | head -c ${i} | xargs
}

# Generate strong and readily identifiable ssh keys.
#  - Requires ssh-keygen.
#  - Generates strong (4096 bit) keys.
#  - Creates SSH keys that are uniquely identifiable via display of
#    the user, host, and precise time of generation in the comment
#    field.
#  - Generated keys have a 1080 day validity period.
create-ssh ()
{
    ssh-keygen -b 4096 -v -V "+1080d" -C "$(whoami)@$(hostname) $(date +"%Y%m%d%H%M%S (%A %B %d %Y %T %Z %z)")"
}

# Print the current date and time in a 'fancy' format.
fancy-date ()
{
    printf "$(date +"%A %B %d %Y %T %Z %z") \n"
}

# Print a nice numeric sortable timestamp of in YYYYMMDDHHMMSS format.
fancy-timestamp ()
{
    printf "$(date +"%Y%m%d%H%M%S") \n"
}

# Full system update using apt
#  - The -y flag isn't passed here, so it's not as crazy as it looks.
#    Package installation via dist-upgrade will still require manual
#    review.
update-system ()
{
    sudo apt-get update && sudo apt-get dist-upgrade && sudo apt-get autoremove && sudo apt-get autoclean
}

# Nothing fancy here, extracts tar archives.
#  - Because who ever remembers the correct tar flags?
untar ()
{
    tar -xvzf
}