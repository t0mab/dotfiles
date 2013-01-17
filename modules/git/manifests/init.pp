define git::config($home='/home/fabien') {
	file { "$home/.gitconfig":
		ensure => file,
		mode => 400,
		source => 'puppet:///modules/git/gitconfig',
		owner => $title,
		group => $title
	}
}
