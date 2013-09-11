# Puppet Module for [NewRelic Plugin Agent](https://github.com/MeetMe/newrelic-plugin-agent)

## Usage

    class { 'newrelic_plugin_agent':
        newrelic_license_key => 'YOUR_LICENSE_KEY',
        configuration_source => 'path/to/your/config/file/tmplate/newrelic_plugin_agent.cfg.erb',
    } 

## Config File

Use the file templates/newrelic_plugin_agent.cfg in this module as a basis for your own config file template.