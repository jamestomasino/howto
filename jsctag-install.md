# Install jsctags
jsctags is a feature that ships in the doctorjs repo. It mimics ctags in output but is designed for a better introspection of JavaScript.

The main doctorjs repo is way behind and has a number of issues. Using the tmcw fork.

1. Install [Node.js](http://nodejs.org/)

2. Install doctorjs

		git clone --recursive git://github.com/tmcw/doctorjs.git
		cd doctorjs
		sudo make install
		cd ..
		rm -rf doctorjs

3. Add the following to `~/.bash_profile`:

		export NODE_PATH="/usr/local/lib/node"
		NODE_PATH='/usr/local/lib/jsctags:${NODE_PATH}'
