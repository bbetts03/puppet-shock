
#Note that password and username are specific to each object
group { "puppet":
  ensure => "present",
}

#blogs:
#  - domain:     www.site1.com
#    dbuser:     site1
#    dbpassword: funkbunny1
#    adminuser:  jaxon
#  - domain:     site2.com
#    dbuser:     site2
#    dbpassword: funkbunny2
#    adminuser:  morgajel
#

#hiera('blogs').each do |$blog|
#    blog{$domain: 
#        $domain     => blog['domain'],
#        $adminuser  => blog['adminuser'],
#        $dbuser     => blog['dbuser'],
#        $dbpassword => blog['dbpassword'],
#    }
#end

define blog ($domain) {
#  nginx::resource::vhost { "${domain} vhost":
#    ensure   => present,
#    www_root => "/var/www/${domain}/docs/",
#  }
  class { "${domain} wordpress": 
    wp_owner        => $adminuser, 
    wp_group        => 'nginx', 
    db_user         => $dbuser, 
    db_password     => $dbpassword, 
  }

}

$mysqlconfig=hiera('mysql::server')
class { 'mysql::server':
  config_hash => { 
    'root_password' =>  $mysqlconfig['rootpassword'],
    'port'          =>  '3306',
    'datadir'       =>  '/var/lib/mysql',
    'socket'        =>  '/var/lib/mysql/mysql.sock',
  }
}

class { 'mysql::php': }
#class { 'nginx': }
