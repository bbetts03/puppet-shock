
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
    awstats::config { "$domain awstats":
      domain    => $domain,
      skiphosts => "127.0.0.1 24.192.7.135",
      domain_alias => "www.${domain}",
      skipfiles => "/wp-content/plugins/wp-minify/min/ /wp-admin/admin-ajax.php /wp-content/themes/new-arthemia/scripts/timthumb.php",
    }
  }
}
