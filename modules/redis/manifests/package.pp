class redis::package {

	package { 'redis-server':
		ensure => latest,
		alias  => 'redis',
	}

	file {
		'/var/run/redis':
			ensure => directory,
			owner  => redis,
			group  => redis,
			mode   => 644;
		'/var/lib/redis/':
			ensure => directory,
			owner  => redis,
			group  => redis,
			mode   => 644;

		# don't start default instance (installed by package)
		'/etc/init/redis-server.conf':
			ensure  => absent,
			require => Package['redis-server'];
		'/etc/init.d/redis-server':
			ensure  => absent,
			require => Package['redis-server'];
	}

}
