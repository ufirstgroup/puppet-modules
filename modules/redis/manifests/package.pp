class redis::package {

	package { 'redis-server':
		ensure => latest,
	}

	File {
			require => Package['redis-server']
	}
	file {
		'/var/run/redis':
			ensure  => directory,
			owner   => redis,
			group   => redis,
			mode    => 644;
		'/var/lib/redis/':
			ensure => directory,
			owner  => redis,
			group  => redis,
			mode   => 644;

		# don't start default instance (installed by package)
		'/etc/init/redis-server.conf':
			ensure  => absent;
		'/etc/init.d/redis-server':
			ensure  => absent;
	}

}
