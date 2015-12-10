class showoff (

) inherits showoff::params {

  package { 'showoff':
    ensure   => present,
    provider => gem,
  }

  if $use_rvm {
    class { 'showoff::rvm':
      before => Class['showoff::config'],
    }
  }

  include showoff::config
  include showoff::service

  Class['showoff::config'] -> Class['showoff::service']
}

