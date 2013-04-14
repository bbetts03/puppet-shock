

define nginx::vhost(
  $domain,
) {

  File {
    owner => 'root',
    group => 'root',
    mode  => '0644',
  }
  file { "${domain}.conf":
    path =>"/etc/nginx/sites/${domain}.conf",
    content => template("nginx/vhost.conf.erb"),


  }



}
