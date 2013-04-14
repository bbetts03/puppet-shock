
class shock::users {

  user { "morgajel" :
    uid     => 1000,
    comment => 'Jesse',
    gid     => 'morgajel',
    groups  => ['wheel'],
  }
  group{ 'morgajel':
    gid=>1000,
  }




  user { "jaxon" :
    uid     => 1001,
    comment => 'Jackie',
    gid     => 'jaxon',
    groups  => [],
  }
  group{ 'jaxon':
    gid=>1001,
  }


}
