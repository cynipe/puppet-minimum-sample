class profile::docker(
  $docker_config   = undef,
  $admins          = [],
  $images          = [],
  $install_compose = false,
) {

  validate_hash($docker_config)
  validate_array($admins)
  validate_array($images)
  validate_bool($install_compose)

  create_resources('class', { '::docker' => $docker_config })

  if !empty($preinstall_images) {
    profile::docker::image { $preinstall_images: }
  }

  if !empty($admins) {
    profile::docker::admin { $admins: }
  }

  if $install_compose {
    $docker_compose_version = '1.1.0-rc2'
    exec { 'Install docker-compose':
      command => "curl -L https://github.com/docker/fig/releases/download/${docker_compose_version}/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose; chmod +x /usr/local/bin/docker-compose",
      unless  => "[ -f /usr/local/bin/docker-compose ] && docker-compose --version | grep ${docker_compose_version}",
    }
  }

}
