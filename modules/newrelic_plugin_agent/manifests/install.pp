class newrelic_plugin_agent::install (
) {
	$newrelic_license_key = $::newrelic_plugin_agent::newrelic_license_key
	$configuration_source = $::newrelic_plugin_agent::configuration_source
	$pidfile = "/var/run/newrelic/${::newrelic_plugin_agent::params::proc_name}.pid"
	$confdir = "/etc/newrelic"
	$conffile = "${confdir}/newrelic_plugin_agent.cfg"

	$user  = $::newrelic_plugin_agent::params::user
	$group = $::newrelic_plugin_agent::params::group

	group { $group:
		system => true,
		ensure => "present",
	}
	user { $user:
		system => true,
		gid => $group,
		require => Group[$group],
	}

	class { '::python':
		version		=> 'system',
		pip			=> true,
		virtualenv	=> false,
	}

	::python::pip { 'newrelic-plugin-agent':
		owner       => 'root',
		require => Class['::python'],
	}

	File {
		owner   => root,
		group   => root,
		mode    => '0644',
	}

	file {
		"${confdir}":
			ensure => directory;
		"${conffile}":
			ensure => file,
			content => template($configuration_source),
			require => File[$confdir];
		"/etc/init/${::newrelic_plugin_agent::params::proc_name}.conf":
			content => template('newrelic_plugin_agent/newrelic_plugin_agent_init_script.conf.erb');
		"/etc/init.d/${::newrelic_plugin_agent::params::proc_name}":
			ensure => 'link',
			target => '/lib/init/upstart-job';
	}


}