# gitflow and git-flow-completion Installation

## Install homebrew:

	$ ruby -e "$(curl -fsSkL raw.github.com/mxcl/homebrew/go)"

## Install gitflow on MacOSX:

	$ mkdir ~/bin
	$ cd !$
	$ curl https://raw.github.com/petervanderdoes/gitflow/develop/contrib/gitflow-installer.sh > gitflow-installer.sh
	$ chmod a+x gitflow-installer.sh
	$ sudo bash gitflow-installer.sh install stable
	$ rm gitflow-installer.sh
	$ brew install gnu-getopt

Create a ~/.gitflow_export with the content alias getopt="$(brew --prefix gnu-getopt)/bin/getopt".

## Install git-completion

	$ brew install git bash-completion

If the install fails, you already have git installed. Try this instead:
	
	$ brew install bash-completion
	
Install the following to your ~/.bash_profile:
	
	if [ -f `brew --prefix`/etc/bash_completion ]; then
		. `brew --prefix`/etc/bash_completion
	fi
	
Restart your terminal or run: 
	
	$ source ~/.bash_profile

## Install git-flow-completion

	$ wget https://github.com/petervanderdoes/git-flow-completion/blob/develop/git-flow-completion.bash
	$ chmod 755 git-flow-completion.bash
	$ mv git-flow-completion.bash ~/.git-flow-completion.sh
	
Add the following to your ~/.bash_profile:

	if [ -f ~/.git-flow-completion.sh ] ; then
		source ~/.git-flow-completion.sh
	fi

## Initialization of a new repo
	
	$ git flow init
