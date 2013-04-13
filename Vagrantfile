# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|

  config.vm.box = "shock"
  config.vm.host_name="shock.vm"

  config.vm.box_url = "http://developer.nrel.gov/downloads/vagrant-boxes/CentOS-6.4-x86_64-v20130309.box"
  config.hiera.config_path = '.'
  config.hiera.config_file = 'hiera.yaml'
  config.hiera.data_path   = 'hieradata'
  # config.vm.boot_mode = :gui


  config.vm.provision :puppet,  :facter => { "testvalue" => "test" } do |puppet|
    puppet.manifests_path = "manifests"
    puppet.manifest_file  = "shock.pp"
    puppet.module_path    = "modules"    
  end

end
