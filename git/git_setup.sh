#!/bin/bash

# Setup the global user
`git config --global user.name "John Divelbiss"`

# Configure Username/Password Caching
`git config --global credential.helper cache`
# Sets the password caching to 1 hour
`git config --global credential.helper 'cache --timeout=3600'`

# Setup some useful aliases to make life easier
# co = checkout
`git config alias.co checkout`
# ci = commit
`git config alias.ci commit`
# st = status
`git config alias.st status`
# br = branch 
`git config alias.br branch`
# add_all files
`git config alias.add-all '!git add -A && git status'`
