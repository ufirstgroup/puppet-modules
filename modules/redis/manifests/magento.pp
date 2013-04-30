class redis::magento (
	$maxmemory_cache,
	$maxmemory_fpc,
	$maxmemory_session,
) {
	include redis::php

	$socket_cache   = "/var/run/redis/redis-magento-cache.sock"
	$socket_fpc     = "/var/run/redis/redis-magento-fpc.sock"
	$socket_session = "/var/run/redis/redis-magento-session.sock"

	redis::instance {
		'magento-cache':
			maxmemory => $maxmemory_cache,
			socket    => $socket_cache;
		'magento-fpc':
			maxmemory => $maxmemory_fpc,
			socket    => $socket_fpc;
		'magento-session':
			maxmemory => $maxmemory_session,
			socket    => $socket_session,
			save      => true;
	}

	# don't forget $magento_root/shell/redis_gc.php

}
