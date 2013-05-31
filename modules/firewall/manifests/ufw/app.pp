define firewall::ufw::app ($state, $from = "any", $ensure = present) {

	include firewall::ufw

	# if status is inactive we cannot query for current rules

	if $::firewall::ufw::status == 'active' {

		if $state == 'allow' {
			if $ensure == present {

				exec { "/usr/sbin/ufw allow from $from to any app '$name'":
					unless  => "/usr/sbin/ufw status | /bin/grep -i \"$name *ALLOW *$from\"",
					require => Package['ufw'],
				}

			}
			else {

				exec { "/usr/sbin/ufw delete allow from $from to any app '$name'":
					onlyif  => "/usr/sbin/ufw status | /bin/grep -i \"$name *ALLOW *$from\"",
					require => Package['ufw'],
				}

			}
		}
		elsif $state == 'deny' {
			if $ensure == present {

				exec { "/usr/sbin/ufw deny from $from to any app '$name' > /dev/null":
					unless  => "/usr/sbin/ufw status | /bin/grep -i \"$name *DENY *$from\"",
					require => Package['ufw'],
				}

			}
			else {

				exec { "/usr/sbin/ufw delete deny from $from to any app '$name' > /dev/null":
					onlyif   => "/usr/sbin/ufw status | /bin/grep -i \"$name *DENY *$from\"",
					require => Package['ufw'],
				}

			}
		}
		else {
			err("invalid state for firewall::ufw::app (state: $state)")
		}

	}

}
