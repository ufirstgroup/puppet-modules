define redis::instance (
	$maxmemory,
	$bind = null,
	$port = null,
	$socket = null,
	$save = false,
) {

	include redis::package

	$procname  = "redis-${name}"
	$pidfile   = "/var/run/redis/${procname}.pid"
	$conffile  = "/etc/redis/${procname}.conf"

	File {
		owner   => root,
		group   => root,
		mode    => '0644',
	}

	file {
		$conffile:
			content => template('redis/redis.conf.erb');
		"/etc/init/${procname}.conf":
			content => template('redis/redis_server_init_script.conf.erb');
		"/etc/init.d/${procname}":
			ensure => 'link',
			target => '/lib/init/upstart-job';
	}

	service { $procname:
		enable    => true,
		ensure    => running,
	}

	File[$conffile]         ~> Service[$procname]
	Package['redis-server'] ~> Service[$procname]

}
