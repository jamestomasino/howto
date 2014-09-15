# OSX Development Environment Setup

## Dependencies

- Install XCode
- Install [command line tools](http://connect.apple.com/)

# Install #

## Install homebrew:

	$ sudo dseditgroup -o edit -a ``whoami`` -t user admin
	$ sudo dseditgroup -o edit -a ``whoami`` -t user wheel
	$ sudo chmod -R g+w /usr/local/
	$ ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
	$ brew doctor
	$ brew update && brew upgrade
	$ brew install wget

## Backup system Ruby and install RVM instead
	$ sudo mv `which ruby` `which ruby`-old
	$ \curl -L https://get.rvm.io | bash
	$ rvm use homebrew
	
Edit your `~/.bash_profile` and add the following:
	
	if [ -f $HOME/.rvm/scripts/rvm ]; then
		source $HOME/.rvm/scripts/rvm
	fi
	
Restart your terminal or run: 
	
	$ source ~/.bash_profile

## Set up Ruby 2.0 as the default

	$ rvm install 2.0
	$ rvm use --default 2.0

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
	$ brew install vim --with-python3 --with-tcl --with-perl --override-system-vi
	$ brew install tmux
	$ sudo mv /usr/bin/vim /usr/bin/vim72

## Fixing broken stuff in OSX

	$ brew install gnu-sed --default-names


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
