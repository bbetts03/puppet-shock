class phpfpm::config {
    file { "/etc/sysconfig/php-fpm":
        ensure => present,
        owner => 'root',
        group => 'root',
        mode => 0444,
        source => "puppet:///modules/phpfpm/php-fpm",
        require => Class["phpfpm::install"],
        notify => Class["phpfpm::service"],
    }
}
