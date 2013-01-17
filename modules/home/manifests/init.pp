define home::ssh($home='/home/fabien') {
	file { 'ssh_dir':
		path => "$home/.ssh",
		ensure => directory,
		mode => 500,
		owner => $title,
		group => $title
	}

	file { "$home/.ssh/config":
		ensure => file,
		mode => 444,
		source => 'puppet:///modules/home/ssh_config',
		require => File['ssh_dir'],
		owner => $title,
		group => $title
	}
}

define home::tmux($home='/home/fabien') {
	file { "$home/.tmux.conf":
		ensure => file,
		mode => 444,
		source => 'puppet:///modules/home/tmux.conf',
		owner => $title,
		group => $title
	}
}

define home::xmodmap($home='/home/fabien') {
	file { "$home/.Xmodmap":
		ensure => file,
		mode => 444,
		source => 'puppet:///modules/home/Xmodmap',
		owner => $title,
		group => $title
	}
}

define home::zsh($home='/home/fabien') {
	package { zsh: ensure => present }

	file { "$home/.zshrc":
		ensure => file,
		mode => 444,
		source => 'puppet:///modules/home/zshrc',
		owner => $title,
		group => $title
	}

	file { "$home/.zshenv":
		ensure => file,
		mode => 444,
		source => 'puppet:///modules/home/zshenv',
		owner => $title,
		group => $title
	}

	user { $title:
		shell => '/usr/bin/zsh',
		require => Package[zsh],
	}
}
