
class shock::blogs {


  $blogs=hiera('blogs')
  
  blog{$blogs: }
  
  file {'/var/www' :
      ensure=>'directory',
  }
  
  
  define blog () {
    $domain     = $name['domain']
    $adminuser  = $name['adminuser']
    $dbuser     = $name['dbuser']
    $dbpassword = $name['dbpassword']
  
      file {"/var/www/${domain}" :
          ensure=>'directory',
      }
  
    wordpress { "${domain} wordpress": 
      wp_owner        => $adminuser, 
      install_url     => 'http://wordpress.org',
      wp_group        => 'nginx', 
      domain          => $domain,
      install_dir     => "/var/www/${domain}/docs/",
      db_user         => $dbuser, 
      db_name         => $dbname, 
      db_password     => $dbpassword, 
    }
    #nginx::vhost { "${domain} vhost":
    #  ensure   => present,
    #  www_root => "/var/www/${domain}/docs/",
    #}
  
  }
  
}
