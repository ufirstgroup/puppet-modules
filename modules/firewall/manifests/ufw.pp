class firewall::ufw {

	$app_config_dir = '/etc/ufw/applications.d'

	package { 'ufw':
		ensure => present,
	}
	exec { '/usr/sbin/ufw --force enable':
		unless    => "/usr/sbin/ufw status | /bin/grep \"Status: active\"",
	}

}
