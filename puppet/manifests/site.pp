require 'stdlib'

Exec {
  logoutput => on_failure,
  path      => [
    '/usr/bin',
    '/bin',
    '/usr/sbin',
    '/sbin',
  ]
}

Yumrepo <| |> -> Package <| provider != 'rpm' |>
Package {
  allow_virtual => true,
}

hiera_include('classes')
