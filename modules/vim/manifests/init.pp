define vim::config($home='/home/fabien') {
	package { vim: ensure => present }
	package { 'vim-puppet': ensure => present }

	file { "$home/.vimrc":
		ensure => file,
		mode => 400,
		source => 'puppet:///modules/vim/vimrc',
		owner => $title,
		group => $title
	}

	file { "$home/.vim":
		ensure => directory,
		mode => 500,
		source => 'puppet:///modules/vim/vim',
		recurse => true,
		owner => $title,
		group => $title
	}
}
