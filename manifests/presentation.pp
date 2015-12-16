define showoff::presentation (
  $path       = "${showoff::root}/${title}",
  $user       = $showoff::user,
  $group      = $showoff::group,
  $enabled    = $showoff::enabled,
  $allow_exec = $showoff::params::allow_exec,
  $file       = $showoff::params::file,
  $nocache    = $showoff::params::nocache,
  $host       = $showoff::params::host,
  $port       = $showoff::params::port,
  $ssl        = $showoff::params::ssl,
  $cert       = $showoff::params::cert,
  $key        = $showoff::params::key,
) {
  case $showoff::init {
    'systemd': {
      file { "/usr/lib/systemd/system/showoff-${title}.service":
        ensure  => file,
        owner   => 'root',
        group   => 'root',
        mode    => '0644',
        content => template('showoff/showoff.service.erb'),
        before  => Service["showoff-${title}"],
      }
    }
    'sysv': {
      fail("Sorry, we don't have a SysV init script yet :-/")
    }
    default: {
      fail("how'd we get here?")
    }
  }

  if $enabled {
    service { "showoff-${title}":
      ensure => running,
      enable => true,
    }
  } else {
    service { "showoff-${title}":
      ensure => stopped,
      enable => false,
    }
  }
}
