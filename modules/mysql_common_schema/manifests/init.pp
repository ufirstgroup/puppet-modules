class mysql_common_schema (
        $version = "2.2",
    ) {
    mysql_common_schema { "${version}":
      ensure        => 'present',
      mgmt_cnf      => '/etc/mysql/debian.cnf',
    }
}
