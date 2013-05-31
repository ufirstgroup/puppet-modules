class firewall::ufw($status) {

	$app_config_dir = '/etc/ufw/applications.d'

	package { 'ufw':
		ensure => present,
	}

	if $status == 'active' {

		exec { '/usr/sbin/ufw --force enable':
			unless => "/usr/sbin/ufw status | /bin/grep \"Status: active\"",
		}

		# make rules are set before activating the firewall
		Firewall::Ufw::App<| |> -> Exec['/usr/sbin/ufw --force enable']

	} elsif $status == 'inactive' {

		exec { '/usr/sbin/ufw --force disable':
			unless => "/usr/sbin/ufw status | /bin/grep \"Status: inactive\"",
		}

		# disable the firewall before changing rules
		Exec['/usr/sbin/ufw --force disable'] -> Firewall::Ufw::App <| |>

	} else {

		err("invalid status for firewall::ufw (status: $status)")

	}

}
