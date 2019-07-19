#!/bin/bash

# Force locale settings
#  - edit to suit your preffered locale because it probably isn't going to be
#    en_NZ unless you happen to live in New Zealand.
#  - But if it is...chur boss.
export LANG="en_NZ.UTF-8"
export LANGUAGE="en_NZ:en"

# Nothing is more annoying than case insensitive collation.
export LC_COLLATE="C"