define showoff::presentation (
  $allow_exec = $showoff::params::allow_exec,
  $file       = $showoff::params::file,
  $nocache    = $showoff::params::nocache,
  $host       = $showoff::params::host,
  $port       = $showoff::params::port,
  $ssl        = $showoff::params::ssl,
  $cert       = $showoff::params::cert,
  $key        = $showoff::params::key,
  $repository = undef,
) {
  File {
    owner => 'root',
    group => 'root',
    mode  => '0644',
  }
  $path = "${showoff::root}/${title}"

  if $repository {
    vcsrepo { $path:
      ensure   => present,
      owner    => $showoff::owner,
      group    => $showoff::group,
      provider => git,
      source   => $repository,
    }
  }

  case $showoff::init {
    'systemd': {
      file { "/etc/systemd/system/multi-user.target.wants/showoff-${title}.service":
        ensure  => file,
        content => template('showoff/showoff.service.erb'),
      }

      service { "showoff-${title}":
        ensure => running,
        enable => true,
      }
    }
    'sysv': {
      fail("Sorry, we don't have a SysV init script yet :-/")
    }
    default: {
      fail("how'd we get here?")
    }
  }
}