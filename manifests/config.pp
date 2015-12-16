class showoff::config {
  assert_private('This class should not be called directly')

  if $showoff::user and $showoff::manage_user {
    user { $showoff::user:
      ensure => present,
    }
  }
  if $showoff::group and $showoff::manage_group {
    group { $showoff::group:
      ensure => present,
    }
  }

  file { $showoff::root:
    ensure => directory,
    owner  => $showoff::user,
    group  => $showoff::group,
  }

}
