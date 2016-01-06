class showoff (
  $version = $showoff::params::version,
  $use_rvm = $showoff::params::use_rvm,

  $enabled = $showoff::params::enabled,

  $manage_user = $showoff::params::manage_user,
  $user        = $showoff::params::user,
  $group       = $showoff::params::group,
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
