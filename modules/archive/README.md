Archive Puppet Module
====================

Overview
--------

Puppet module to download and extract tar and zip archives based on [camptocamp/puppet-archive](https://github.com/camptocamp/puppet-archive).

Supported archive types are:

- `tar.gz`, `tgz`
- `tar.bz2`, `tbz2`
- `tar.xz`, `txz`
- `zip`

Usage
-----

Example:

    archive { 'apache-tomcat-6.0.26':
      ensure => present,
      url    => 'http://archive.apache.org/dist/tomcat/tomcat-6/v6.0.26/bin/apache-tomcat-6.0.26.tar.gz',
      target => '/opt',
    }
