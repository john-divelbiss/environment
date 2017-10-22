# ~/.bash_aliases execute by .bashrc
# Holds various environment setup
echo "Including .bash_alias"

INSTALL_PATH=${HOME}/src/environment
ALIAS_PATH=${HOME}/.bash_aliases
GIT_ALIAS_PATH=${HOME}/.config/git_aliases

#export ARDUINO_DIR=/opt/arduino-1.8.5
#export ARDMK_DIR=/usr
#export AVR_TOOLS_DIR=/usr

# Alias definitions.
alias ed_alias='vim -O ${INSTALL_PATH}/env/.bash_aliases ${ALIAS_PATH}'
alias ed_git='vim -O ${INSTALL_PATH}/git/git_aliases ${GIT_ALIAS_PATH}'

alias re_alias='cp ${INSTALL_PATH}/env/.bash_aliases ${ALIAS_PATH} && . ${ALIAS_PATH}'
alias re_git='cp ${INSTALL_PATH}/git/git_aliases ${GIT_ALIAS_PATH} && . ${GIT_ALIAS_PATH}'

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

