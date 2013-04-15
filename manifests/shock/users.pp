
class shock::users {

  user { "morgajel" :
    ensure      => present,
    uid         => 1000,
    gid         => 'morgajel',
    comment     => 'Jesse',
    managehome  => true,
    groups      => ['wheel'],
  }
  group{ 'morgajel':
    gid=>1000,
  }

  file{ "/home/morgajel/.ssh":
    ensure  => directory,
    owner   => 'morgajel',
    group   => 'morgajel',
    mode    => 0700,
    require =>User["morgajel"],
  }

  ssh_authorized_key{ 'morgajel@hippy key':
    ensure =>'present',
    user =>['morgajel'],
    key=>'AAAAB3NzaC1kc3MAAACBAMik2w3Wga+bOGKluzygLzzzM070GLqxT53Yxm0gaAlKOJnNUBrz2VQQHByeoXP+GVUoml4xsdWciMlNDsZhHYNQdd/67AXI91NwDoFWmDiLTW+ooJRhCmz1HGPxD4ooX+z35LrvZ838C3d7BmFGV1kVWc6/3zdAg4bq5iQPVQRxAAAAFQCzBge5OAGZoNB3f0+EC5IadjuX6QAAAIBaBB0wnulcZEeUOmLxWq67Hh7ZczzJxYPrPooSph6oyzEjyf1jNLj6te6YgnObbZgdzYrC11c3WhmMy3+XBvbedTAYU59WM/IbNJ7afkMyX6b04B4VOgPUKWrJuC9mW+/MLf7s/os1ZTliZ0x1TI3fDAtePGnWIuu0ZeHnBd7EGAAAAIB+X8m92/30pyB2Fd8q0XP17TEdCVqOeJqWwSXJcoVn6izwJ6H/UCkfOFqtFsSlJxToyv2F/jtR4XWM8ouENtADxO7DNVpvED8dQwOQmyis/aBE++8nSN9tuP0xHSEDejn3FqPxP9SLzJb2b8tcl9GfGB54KC47tbmAUAIZuB8kLg==',
    require =>File["/home/morgajel/.ssh"],
  }



  user { "jaxon" :
    uid     => 1001,
    comment => 'Jackie',
    gid     => 'jaxon',
    managehome => true,
    groups  => [],
  }
  group{ 'jaxon':
    gid=>1001,
  }


}
