class shock::packages {

  package{ 'vim-enhanced':
    ensure  =>present,
  }

  package{ 'wget':
    ensure  =>present,
  }

  package{ 'php-cli':
    ensure  =>present,
  }

}
