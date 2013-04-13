# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|

  config.vm.box = "shock"
  config.vm.host_name="shock.vm"

  config.vm.box_url = "http://developer.nrel.gov/downloads/vagrant-boxes/CentOS-6.4-x86_64-v20130309.box"
  # config.vm.boot_mode = :gui


  config.vm.provision :puppet do |puppet|
    puppet.options = "--hiera_config hiera.yaml"
    puppet.manifests_path = "manifests"
    puppet.manifest_file  = "shock.pp"
    puppet.module_path    = "modules"    
    puppet.facter = {
        ## tells default.pp that we're running in Vagrant
        "is_vagrant" => true,
    }
  end

end
