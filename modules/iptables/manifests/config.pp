
class iptables::config {
    file { "/etc/sysconfig/iptables":
        ensure => present,
        owner => 'root',
        group => 'root',
        mode => 0600,
        source => "puppet:///modules/iptables/iptables",
        require => Class["iptables::install"],
        notify => Class["iptables::service"],
    }
}
