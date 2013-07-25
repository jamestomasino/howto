#!/usr/bin/env bash

BASH_MIN_VERSION="3.2.25"
if
  [[ -n "${BASH_VERSION:-}" &&
    "$(printf "%b" "${BASH_VERSION:-}\n${BASH_MIN_VERSION}\n" | LC_ALL=C sort -n -t"." | head -n1)" != "${BASH_MIN_VERSION}"
  ]]
then
  echo "BASH ${BASH_MIN_VERSION} required (you have $BASH_VERSION)"
  exit 1
fi

####
#### RUBY
####

# Remove old Ruby
sudo rm `which ruby`

# Install RVM
\curl -L https://get.rvm.io | bash

# Append RVM script trigger to .bash_profile
echo 'if [ -f $HOME/.rvm/scripts/rvm ]; then source $HOME/.rvm/scripts/rvm; fi' >> ~/.bash_profile

# Now run your .bash_profile so we're up to date
source ~/.bash_profile

####
#### Homebrew
####

# Take ownership of /usr/local - this is broken on mac by default
sudo chown -R `whoami` /usr/local

# get Homebrew
ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"

# get wget
brew install wget

####
#### git
####

# backup old git if there's a system one
if [ -f /usr/bin/git ]; 
	then sudo mv /usr/bin/git /usr/bin/git-old
fi

# get new git
brew install git

# get git-flow - the good version
brew install git-flow-avh

# add gitflow config to .bashrc then make sure .bashrc gets used by .bash_profile
echo 'export FLAGS_GETOPT_CMD="$(brew --prefix gnu-getopt)/bin/getopt"' >> ~/.bashrc
echo 'if [ -f ~/.bashrc ] ; then . ~/.bashrc; fi' >> ~/.bash_profile

# get bash-completion for git
brew install git bash-completion

# add bash-completion config to .bash_profile
echo 'if [ -f `brew --prefix`/etc/bash_completion ]; then . `brew --prefix`/etc/bash_completion; fi' >> ~/.bash_profile

# Now run your .bash_profile so we're up to date
source ~/.bash_profile

# get git-flow-completion
wget https://raw.github.com/petervanderdoes/git-flow-completion/develop/git-flow-completion.bash
chmod 755 git-flow-completion.bash
mv git-flow-completion.bash ~/.git-flow-completion.sh

# add git-flow-completion config to .bash_profile
echo 'if [ -f ~/.git-flow-completion.sh ] ; then source ~/.git-flow-completion.sh; fi' >> ~/.bash_profile

# Now run your .bash_profile so we're up to date
source ~/.bash_profile
