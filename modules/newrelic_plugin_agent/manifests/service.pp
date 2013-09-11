class newrelic_plugin_agent::service (
) {

	service { "${::newrelic_plugin_agent::params::proc_name}":
		enable    => true,
		ensure    => running,
		require => [User['newrelic'], Group['newrelic']],
	}

}