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
	$ echo 'alias getopt="$(brew --prefix gnu-getopt)/bin/getopt"' > ~/.gitflow_export

## Install git-completion

	$ brew install git bash-completion

If the install fails, you already have git installed. Try this instead:
	
	$ brew install bash-completion
	
Edit your `~/.bash_profile` and add the following:
	
	if [ -f `brew --prefix`/etc/bash_completion ]; then
		. `brew --prefix`/etc/bash_completion
	fi
	
Restart your terminal or run: 
	
	$ source ~/.bash_profile

## Install git-flow-completion

	$ brew install wget
	$ wget https://raw.github.com/petervanderdoes/git-flow-completion/develop/git-flow-completion.bash
	$ chmod 755 git-flow-completion.bash
	$ mv git-flow-completion.bash ~/.git-flow-completion.sh
	
Edit your `~/.bash_profile` and add the following:

	if [ -f ~/.git-flow-completion.sh ] ; then
		source ~/.git-flow-completion.sh
	fi

## Basic Usage

* To initializatize a new repo
	
  		git flow init

* To list/start/finish/delete feature branches, use:

  		git flow feature
  		git flow feature start <name> [<base>]
  		git flow feature finish <name>
  		git flow feature delete <name>

  For feature branches, the `<base>` arg must be a commit on `develop`.

* To push/pull a feature branch to the remote repository, use:

  		git flow feature publish <name>
		git flow feature pull <remote> <name>

* To list/start/finish/delete release branches, use:

  		git flow release
  		git flow release start <release> [<base>]
  		git flow release finish <release>
  		git flow release delete <release>

  For release branches, the `<base>` arg must be a commit on `develop`.

* To list/start/finish/delete hotfix branches, use:

  		git flow hotfix
  		git flow hotfix start <release> [<base>]
  		git flow hotfix finish <release>
  		git flow hotfix delete <release>

  For hotfix branches, the `<base>` arg must be a commit on `master`.

* To list/start support branches, use:

  		git flow support
  		git flow support start <release> <base>

  For support branches, the `<base>` arg must be a commit on `master`.
