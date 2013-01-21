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

	file { "$home/.vim-tmp":
		ensure => directory,
		mode => 700,
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

	exec { "$home/.vim/bundle/vundle":
		command => "/usr/bin/git clone https://github.com/gmarik/vundle.git $home/.vim/bundle/vundle",
		creates => "$home/.vim/bundle/vundle",
	}

	file { "$home/.vim/bundle":
		require => File["$home/.vim"],
		ensure => directory,
		owner => $title,
		group => $title,
		recurse => true
	}
}
