class showoff::params {
  $version = present
  $root    = '/var/cache/showoff'
  $user    = 'showoff'
  $group   = 'showoff'

  $manage_user  = true
  $manage_group = true

  # generate RVM wrappers to start with a working Ruby environment
  if $os['family'] == 'RedHat' {
    if $os['release']['major'] == 6 {
      $use_rvm = true
      $init    = 'sysv'
    }
    else {
      $use_rvm = false
      $init    = 'systemd'
    }
  }
  else {
    fail("Sorry, we don't support ${os['family']} yet!")
  }

  $allow_exec = false
  $file       = undef
  $nocache    = undef
  $host       = undef
  $port       = undef
  $ssl        = undef
  $cert       = undef
  $key        = undef
}
