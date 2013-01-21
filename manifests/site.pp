$user = 'fabien'
$home = "/home/$user"

node 'mrtea' {
	packages::common { 'packages': }
	packages::dev { 'packages': }
	packages::desktop { 'packages': }
	packages::tex { 'packages': }

	vim::config { $user:
		home => $home
	}

	home::solarized { $user:
		home => $home
	}

	home::ssh { $user:
		home => $home
	}

	home::tmux { $user:
		home => $home
	}

	home::xmodmap { $user:
		home => $home
	}

	home::zsh { $user:
		home => $home
	}

	git::config { $user:
		home => $home
	}
}

node 'nasty' {
	packages::common { 'packages': }
	packages::dev { 'packages': }

	vim::config { $user:
		home => $home
	}

	home::solarized { $user:
		home => $home
	}

	home::ssh { $user:
		home => $home
	}

	home::tmux { $user:
		home => $home
	}

	home::xmodmap { $user:
		home => $home
	}

	home::zsh { $user:
		home => $home
	}

	git::config { $user:
		home => $home
	}
}
