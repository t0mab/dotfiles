# Go to Git root, execute ./setup.py install and then, go back
function pyup () {
	cd $(git rev-parse --show-toplevel)
	./setup.py install
	cd -
}

function activate () {
	repository=${$(git rev-parse --show-toplevel)##*/}
	[ ! -d ~/VirtualEnv/$repository ] && virtualenv ~/VirtualEnv/$repository
	source ~/VirtualEnv/$repository/bin/activate
}

function pull-them-all () {
	for repos in *; do
		echo $repos
		echo '-------'
		cd $repos
		git pull --all
		cd ..
	done
}