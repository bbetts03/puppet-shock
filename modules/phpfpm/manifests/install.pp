class phpfpm::install {

  package{'phpfpm':
    name=>"php-fpm",
    ensure=>present,
  }
}

