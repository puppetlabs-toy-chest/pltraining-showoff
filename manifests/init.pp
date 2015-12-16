class showoff (
  $version = $showoff::params::version,
  $use_rvm = $showoff::params::use_rvm,
  $user    = $showoff::params::user,
  $group   = $showoff::params::group,

  $manage_user  = $showoff::params::manage_user,
  $manage_group = $showoff::params::manage_group,

) inherits showoff::params {

  package { 'showoff':
    ensure   => $version,
    provider => gem,
  }

  if $use_rvm {
    include showoff::rvm
  }

  include showoff::config

}
