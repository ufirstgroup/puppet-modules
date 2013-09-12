class newrelic_plugin_agent::service (
) {

	service { "${newrelic_plugin_agent::proc_name}":
		enable    => true,
		ensure    => running,
		require => [User[$newrelic_plugin_agent::user], Group[$newrelic_plugin_agent::group]],
	}

}