define profile::docker::admin {

  exec { "Add docker group to ${name} user":
    command => "/usr/sbin/usermod -a -G docker ${name}",
    unless  => '/usr/bin/groups vagrant | /usr/bin/grep docker',
    require => Class['::docker'],
  }
}

