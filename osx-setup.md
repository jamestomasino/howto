# OSX Development Environment Setup

## Dependencies

Either:

- Install XCode
- Or install `gcc` [directly, without XCode](https://github.com/kennethreitz/osx-gcc-installer)

Install [command line tools](http://connect.apple.com/)

# Install #

This method is probably safer as you can see the output from each step. Plus, the installers for `homebrew` and `rvm` keep changing on me and sometimes this guide is out of date.

## Remove system Ruby and install RVM
	$ sudo rm `which ruby`
	$ \curl -L https://get.rvm.io | bash
	
Edit your `~/.bash_profile` and add the following:
	
	if [ -f $HOME/.rvm/scripts/rvm ]; then
		source $HOME/.rvm/scripts/rvm
	fi
	
Restart your terminal or run: 
	
	$ source ~/.bash_profile

## Set up Ruby 1.9.3 as the default

	$ rvm install 1.9.3
	$ rvm use --default 1.9.3

## Install homebrew:

	$ sudo dseditgroup -o edit -a ``whoami`` -t user admin
	$ sudo dseditgroup -o edit -a ``whoami`` -t user wheel
	$ sudo chmod -R g+w /usr/local/
	$ rvm use homebrew
	$ ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
	$ brew doctor
	$ brew update && brew upgrade
	$ brew install wget
	
## Install git

	$ sudo mv /usr/bin/git /usr/bin/git-old
	$ brew install git

## Install gitflow

	$ brew install git-flow-avh
	
Edit your `~/.bashrc` and add the following:

	export FLAGS_GETOPT_CMD="$(brew --prefix gnu-getopt)/bin/getopt"
	
Edit your `~/.bash_profile` and verify that you have the following:

	if [ -f ~/.bashrc ] ; then
		. ~/.bashrc
	fi

## Install git-completion

	$ brew install git bash-completion
	$ brew install --build-from-source gnu-getopt
	$ echo 'export FLAGS_GETOPT_CMD="$(brew --prefix gnu-getopt)/bin/getopt' > ~/.gitflow_export
	
Edit your `~/.bash_profile` and add the following:
	
	if [ -f `brew --prefix`/etc/bash_completion ]; then
		. `brew --prefix`/etc/bash_completion
	fi
	
Restart your terminal or run: 
	
	$ source ~/.bash_profile

## Install git-flow-completion
	
	$ wget https://raw.github.com/petervanderdoes/git-flow-completion/develop/git-flow-completion.bash
	$ chmod 755 git-flow-completion.bash
	$ mv git-flow-completion.bash ~/.git-flow-completion.sh
	
Edit your `~/.bash_profile` and add the following:

	if [ -f ~/.git-flow-completion.sh ] ; then
		source ~/.git-flow-completion.sh
	fi
	

## Installing vim and MacVim (in progress)

	$ brew install python
	$ pip install --upgrade setuptools && pip install --upgrade pip
	$ brew install macvim
	$ brew linkapps
	$ brew install mercurial
	$ brew install vim
	$ brew install tmux
	$ sudo mv /usr/bin/vim /usr/bin/vim72


# Troubleshooting

## Error similar to:

	flags:ERROR short flag required for (showcommands) on this platform
	flags:ERROR short flag required for (local) on this platform
	flags:ERROR short flag required for (global) on this platform
	flags:ERROR short flag required for (system) on this platform
	flags:ERROR short flag required for (file) on this platform
	/usr/local/bin/gitflow-common: line 79: [: -eq: unary operator expected
	/usr/local/bin/gitflow-common: line 79: [: -eq: unary operator expected
	/usr/local/bin/gitflow-common: line 79: [: -eq: unary operator expected

`gnu-getopt` did not install properly. To fix, try:
	
	$ sudo chown -R `whoami` /usr/local 
	$ brew remove gnu-getopt ; brew install --build-from-source gnu-getopt
	$ echo 'export FLAGS_GETOPT_CMD="$(brew --prefix gnu-getopt)/bin/getopt' > ~/.gitflow_export
