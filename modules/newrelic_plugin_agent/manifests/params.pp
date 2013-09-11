class newrelic_plugin_agent::params (
) {
	case $operatingsystem {
		/(Ubuntu|Debian)/: {
			$proc_name = 'newrelic_plugin_agent'
			$user = 'newrelic'
			$group = 'newrelic'

	}
}
}