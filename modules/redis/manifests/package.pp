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
	}

}
