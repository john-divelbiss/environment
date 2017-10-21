# ~/.bash_aliases execute by .bashrc
# Holds various environment setup

INSTALL_PATH=${HOME}/src/environment
ALIAS_PATH=${HOME}/.bash_aliases
GIT_ALIAS_PATH=${HOME}/.config/git_aliases

# Alias definitions.
alias ed_alias='vim ${ALIAS_PATH}'
alias ed_git='vim ${GIT_ALIAS_PATH}'

alias re_alias='. ${ALIAS_PATH}'
alias re_git='. ${GIT_ALIAS_PATH}'

alias gst='git st'
alias gdt='git difftool'

# Bash colors contains definitions for easily readable bash colors
if [ -f ~/.config/bash_colors ]; then
    . ~/.config/bash_colors
fi

if [ -f ~/.config/git_aliases ]; then
    . ~/.config/git_aliases
fi


# Global Bash Functions for "stuff"

