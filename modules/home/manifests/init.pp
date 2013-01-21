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
		require => Package[zsh]
	}

	exec { "$home/.oh-my-zsh":
		command => "/usr/bin/git clone https://github.com/robbyrussell/oh-my-zsh.git $home/.oh-my-zsh",
		creates => "$home/.oh-my-zsh",
	}

	file { "$home/.oh-my-zsh":
		require => Exec["$home/.oh-my-zsh"],
		ensure => directory,
		owner => $title,
		group => $title,
		recurse => true
	}
}

define home::solarized($home='/home/fabien') {
	exec { "$home/.dircolors-solarized":
		command => "/usr/bin/git clone https://github.com/seebi/dircolors-solarized.git $home/.dircolors-solarized",
		creates => "$home/.dircolors-solarized"
	}

	file { "$home/.dircolors-solarized":
		require => Exec["$home/.dircolors-solarized"],
		ensure => directory,
		owner => $title,
		group => $title,
		recurse => true
	}

	exec { "$home/.gnome-terminal-solarized":
		command => "/usr/bin/git clone https://github.com/sigurdga/gnome-terminal-colors-solarized.git $home/.gnome-terminal-solarized",
		creates => "$home/.gnome-terminal-solarized"
	}

	file { "$home/.gnome-terminal-solarized":
		require => Exec["$home/.gnome-terminal-solarized"],
		ensure => directory,
		owner => $title,
		group => $title,
		recurse => true
	}
}
