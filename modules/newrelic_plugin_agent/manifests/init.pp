class newrelic_plugin_agent (
	$newrelic_license_key = undef,
	$configuration_source = undef,
	$newrelic_env_name = '',
) inherits newrelic_plugin_agent::params {
	if ! $newrelic_license_key {
		fail('athleticum::newrelic: No NewRelic License Key')
	}
	if ! $configuration_source {
		fail('athleticum::newrelic: No Configuration Source')
	}
    include newrelic_plugin_agent::install, newrelic_plugin_agent::service
}
