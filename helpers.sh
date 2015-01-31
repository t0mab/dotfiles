function git_clone()
{
	url=$1
	target=$2

	echo $url

	[ ! -d "$target" ] && git clone --depth 1 $url "$target"

	cd "$target" && git pull && git submodule update --init --recursive
	cd -
}
