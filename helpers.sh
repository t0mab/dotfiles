function git_clone()
{
	url=$1
	target=$2

	[ ! -d "$target" ] && git clone $url "$target"

	cd "$target" && git pull
}
