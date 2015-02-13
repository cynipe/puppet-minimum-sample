class profile::base(
  $selinux_mode    = 'permissive',
  $firewall_ensure = running,
  $packages        = [],
) {

  class { 'selinux': mode => $selinux_mode }

  class { 'firewall': ensure => $firewall_ensure }

  ensure_packages($packages)
}
