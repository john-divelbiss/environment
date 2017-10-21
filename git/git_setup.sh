#!/bin/bash

# Setup the global user
`git config --global user.name "John Divelbiss"`

# Configure Username/Password Caching
`git config --global credential.helper cache`
# Sets the password caching to 1 hour
`git config --global credential.helper 'cache --timeout=3600'`

# Setup git to use beyond compare to diff.  
`git config --global diff.tool bc3`
`git config --global difftool.bc3.path /usr/bin/bcompare`
`git config --global difftool.bc3.trustExitCode true`
`git config --global difftool.prompt false`

# Setup git to use beyond compare to merge
`git config --global merge.tool bc3`
`git config --global mergetool.bc3.path /usr/bin/bcompare`
`git config --global mergetool.bc3.trustExitCode true`
`git config --global mergetool.prompt false`


# Setup some useful aliases to make life easier
# co = checkout
`git config --global alias.co checkout`
# ci = commit
`git config --global alias.ci commit`
# st = status
`git config --global alias.st status`
