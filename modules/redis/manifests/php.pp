class redis::php (
	$serializer = 'none'
){
	php::module { 'redis':
		content => "$module_name/php/",
		notify => Class["php::fpm::service"],
		require => [Class["redis::apt"], Package['php5-igbinary']]
	}
}
