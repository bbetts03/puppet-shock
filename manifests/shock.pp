
#Note that password and username are specific to each object
group { "puppet":
  ensure => "present",
}


$blogs=hiera('blogs')
$blogs.each do |blog|
    blog{$domain: 
        $domain     => blog['domain'],
        $adminuser  => blog['adminuser'],
        $dbuser     => blog['dbuser'],
        $dbpassword => blog['dbpassword'],
    }
end

define blog ($domain) {
  nginx::resource::vhost { "${domain} vhost":
    ensure   => present,
    www_root => "/var/www/${domain}/docs/",
  }
  class { "${domain} wordpress": 
    wp_owner        => $adminuser, 
    wp_group        => 'nginx', 
    db_user         => $dbuser, 
    db_password     => $dbpassword, 
  }

}

class { 'mysql::server':
  config_hash => { 
    'root_password' =>  hiera('mysql::rootpassword'),
    'port'          =>  '3306',
    'datadir'       =>  '/var/lib/mysql',
    'socket'        =>  '/var/lib/mysql/mysql.sock',
    'table_cache'   =>  4,
    'user'          =>  'mysql',
  }
}

class { 'mysql::php': }
class { 'nginx': }
