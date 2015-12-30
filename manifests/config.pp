class showoff::config {
  assert_private('This class should not be called directly')

  File {
    owner => $showoff::user,
    group => $showoff::group,
    mode  => '0644',

  }

  if $showoff::manage_user {
    user { $showoff::user:
      ensure     => present,
      gid        => $showoff::group,
      managehome => true,
    }

    file { "/home/${showoff::user}/.ssh":
      ensure => directory,
    }
  }

  file { $showoff::root:
    ensure => directory,
  }

}
