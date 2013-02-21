# git Installation - OSX

## Install homebrew:

	$ sudo chown -R `whoami` /usr/local	
	$ ruby -e "$(curl -fsSkL raw.github.com/mxcl/homebrew/go)	$ brew install wget
	
## Install git

	$ sudo mv /usr/bin/git /usr/bin/git-old
	$ brew install git

## Install gitflow

	$ brew install git-flow-avh --HEAD

## Install git-completion

	$ brew install bash-completion
	
Edit your `~/.bash_profile` and add the following:
	
	if [ -f `brew --prefix`/etc/bash_completion ]; then
		. `brew --prefix`/etc/bash_completion
	fi
	
Restart your terminal or run: 
	
	$ source ~/.bash_profile

## Install git-flow-complet
	
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


## Troubleshooting

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
	
	Double check that you successfully ran ``sudo chown -R `whoami` /usr/local``. Thegn run `brew link gnu-getopt --force`.
