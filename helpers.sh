function git_clone() {
	url=$1
	target=$2

	echo $url

	[ ! -d "$target" ] && git clone $url "$target"

	cd "$target" && git pull && git submodule update --init --recursive
	cd -
}

function pip_install() {
	pip install --user --upgrade $1
}

function pip2_install() {
	pip2 install --user --upgrade $1
}
