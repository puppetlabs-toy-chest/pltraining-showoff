class showoff::params {
  $version = present
  $root    = '/var/cache/showoff'

  $manage_user = true
  $user        = 'showoff'
  $group       = 'nobody'

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

  $enabled    = true
  $allow_exec = false
  $file       = undef
  $nocache    = undef
  $host       = undef
  $port       = undef
  $ssl        = undef
  $cert       = undef
  $key        = undef
}
