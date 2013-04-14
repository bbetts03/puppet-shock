class phpfpm::service {
    service { "phpfpm":
        name    =>"php-fpm",
        ensure  => running,
        hasstatus => true,
        hasrestart => true,
        enable => true,
        require => Class["phpfpm::config"],
    }
}
