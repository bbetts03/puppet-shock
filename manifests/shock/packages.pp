class shock::packages {

  package{ 'vim-enhanced':
    ensure  =>present,
  }

  package{ 'wget':
    ensure  =>present,
  }
}
