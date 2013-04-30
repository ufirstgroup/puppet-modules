class redis::php {

	include apt
	apt::ppa { 'ppa:ufirst/php': }

	package {
		'php5-igbinary':
			ensure => latest,
			notify => Service["php5-fpm"];
		'php5-redis':
			ensure => latest,
			require => Package['php5-igbinary'],
			notify => Service["php5-fpm"];
	}

	File {
		owner   => root,
		group   => root,
		mode    => '0644',
	}

	file {
		'/etc/php5/conf.d/redis.ini':
			content => "extension=redis.so\nredis.serializer=none",
			notify => Service["php5-fpm"]
	}

}
