class nginx::config {
    file { "/etc/nginx/nginx.conf":
        ensure => present,
        owner => 'root',
        group => 'root',
        mode => 0444,
        source => "puppet:///modules/nginx/nginx.conf",
        require => Class["nginx::install"],
        notify => Class["nginx::service"],
    }
    file { "/etc/nginx/sites/":
        ensure=>directory,
        require=>Package['nginx'],
    }
}
