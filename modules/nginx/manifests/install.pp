class nginx::install {
  user { 'nginx':
    ensure           => 'present',
    uid              => '497',
    gid              => 'nginx',
    comment          => 'Nginx web server',
    home             => '/var/lib/nginx',
    shell            => '/sbin/nologin',
  }
  group { 'nginx':
    ensure => 'present',
    gid    => '497',
  }

  package{'nginx':
    ensure=>present,
  }
}
