#!/bin/bash

#umask 002

# Setup my command prompt
#PS1="\n[\w]\n\[\033[01;32m\]\h\[\033[00m\]: "

#==============================================================
#   Load Scripts
#==============================================================
# load up bashrc just in case
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi
