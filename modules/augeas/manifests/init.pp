class augeas {

  package { 'libaugeas-ruby':
    ensure => present,
  }

  Package['libaugeas-ruby'] -> Augeas <| |>

}
