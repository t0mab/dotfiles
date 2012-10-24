# Go to Git root, execute ./setup.py install and then, go back
function pyup () {
	cd $(git rev-parse --show-toplevel)
	./setup.py install
	cd -
}

function activate () {
	source ~/VirtualEnv/${$(git rev-parse --show-toplevel)##*/}/bin/activate
}
