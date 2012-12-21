# Install jsctags

The latest build has a number of errors. Most importantly, it [gets scope wrong](https://github.com/mozilla/doctorjs/issues/5)  Check out this old commit and everything should work fine.

	git://github.com/mozilla/doctorjs.git
	cd doctorjs
	git checkout 1062dd31625cc002261f15e68af77eedd63a56f6
	sudo make install
	cd ..
	rm -rf doctorjs
