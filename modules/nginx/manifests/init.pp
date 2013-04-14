class nginx {
    include nginx::config, nginx::install, nginx::service
}
