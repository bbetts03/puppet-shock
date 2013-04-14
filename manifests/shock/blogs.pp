
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
    $dbname     = $name['dbname']
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
      notify =>Service['nginx'],
    }
    nginx::vhost { "${domain} vhost":
      domain    => $domain,
    }
  }
}
