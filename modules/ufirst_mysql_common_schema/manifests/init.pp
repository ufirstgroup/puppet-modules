class ufirst_mysql_common_schema (
        $version = "2.2",
    ) {

    file { "/tmp/common_schema-${version}.sql":
        ensure => 'file',
        source => "puppet:///modules/ufirst_mysql_common_schema/common_schema-${version}.sql",
    }

    mysql_common_schema { "${version}":
      ensure        => 'present',
      mgmt_cnf      => '/etc/mysql/debian.cnf',
      require       => File["/tmp/common_schema-${version}.sql"],
     }
}
