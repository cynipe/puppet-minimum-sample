define profile::docker::image(
  $image_name  = $title,
  $ensure      = present,
) {

  validate_string($image_name)
  $image_array = split($image_name, ':')

  ::docker::image { $image_array[0]:
    ensure    => $ensure,
    image_tag => $image_array[1]
  }
}
