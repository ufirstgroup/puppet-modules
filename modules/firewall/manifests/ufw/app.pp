define firewall::ufw::app ($state, $from = "any") {

	include firewall::ufw

	if $state == 'allow' {
		exec { "/usr/sbin/ufw allow from $from to any app '$name'":
			logoutput => on_failure,
			unless    => "/usr/sbin/ufw status | /bin/grep -i \"$name *ALLOW *$from\"",
			require   => Package['ufw'],
		}
	} elsif $state == 'deny' {
		exec { "/usr/sbin/ufw deny from $from to any app '$name'":
			logoutput => on_failure,
			unless    => "/usr/sbin/ufw status | /bin/grep -i \"$name *DENY *$from\"",
			require   => Package['ufw'],
		}
	} else {
		err("invalid state for firewall::ufw::app (state: $state)")
	}

}
