# OSX Development Environment Setup

## Dependencies

Either:

- Install XCode
- Or install `gcc` [directly, without XCode](https://github.com/kennethreitz/osx-gcc-installer)

Install [command line tools](http://connect.apple.com/)

## Remove system Ruby and install RVM
	$ sudo rm `which ruby`
	$ \curl -L https://get.rvm.io | bash
	
Edit your `~/.bash_profile` and add the following:
	
	if [ -f $HOME/.rvm/scripts/rvm ]; then
		source $HOME/.rvm/scripts/rvm
	fi
	
Restart your terminal or run: 
	
	$ source ~/.bash_profile

## Install homebrew:

	$ sudo chown -R `whoami` /usr/local
	$ ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
	$ brew install wget
	
## Install git

	$ sudo mv /usr/bin/git /usr/bin/git-old
	$ brew install git

## Install gitflow

	$ brew install git-flow-avh --HEAD

## Install git-completion

	$ brew install git bash-completion
	
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
	


# Troubleshooting

* Error similar to:

		flags:ERROR short flag required for (showcommands) on this platform
		flags:ERROR short flag required for (local) on this platform
		flags:ERROR short flag required for (global) on this platform
		flags:ERROR short flag required for (system) on this platform
		flags:ERROR short flag required for (file) on this platform
		/usr/local/bin/gitflow-common: line 79: [: -eq: unary operator expected
		/usr/local/bin/gitflow-common: line 79: [: -eq: unary operator expected
		/usr/local/bin/gitflow-common: line 79: [: -eq: unary operator expected

	`gnu-getopt` did not install properly. 
	
	Double check that you successfully ran ``sudo chown -R `whoami` /usr/local``. Then run `brew install gnu-getopt --force`.
