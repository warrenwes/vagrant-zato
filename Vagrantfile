# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::configure("2") do |config|

 config.vm.provider :virtualbox do |vb|
    vb.customize [
      "modifyvm", :id,
      "--memory", "1536",
      "--cpus", "2",
      "--ioapic", "on"
      ]
    end

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box       = 'ubuntu/trusty64'

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  config.vm.box_url   = 'ubuntu/trsuty64'

  config.vm.hostname = "zato"
  #config.vm.synced_folder "www", "/var/www", :nfs => { 
  #  :mount_options   => ['dmode=777,fmode=777'] 
  #}
  config.vm.network :forwarded_port, guest: 8183, host: 8183
  config.vm.network :forwarded_port, guest: 11223, host: 3303
  config.vm.network :private_network, ip: "192.168.33.10"
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "7024"]
  end
  # Uncomment the following line to allow for symlinks
  # in the app folder. This will not work on Windows, and will
  # not work with Vagrant providers other than VirtualBox
  # config.vm.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/app", "1"]
   
  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.

  # Set the Timezone to something useful
  config.vm.provision :shell, :inline => "echo \"America/New_York\" | sudo tee /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata"

  # Assign this VM to a host-only network IP, allowing you to access it
  # via the IP. Host-only networks can talk to the host machine as well as
  # any other machines on the same network, but cannot be accessed (through this
  # network interface) by any external networks.
  
  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  
  ######################################################
  # PROVISIONINING
  # Following provisions execute in the order they are
  # defined.
  ######################################################
  #config.vm.provision :shell, :path => "vm/shell/initial-setup.sh"

  # Enable provisioning with Puppet stand alone.  Puppet manifests
  # are contained in a directory path relative to this Vagrantfile.
  # You will need to create the manifests directory and a manifest in
  # the file base.pp in the manifests_path directory.
  #
  config.vm.provision :puppet do |puppet|
     puppet.facter = { "fqdn" => "local.devbox", "hostname" => "devbox" }
     puppet.manifests_path = "vm/manifests"
     puppet.manifest_file  = "base.pp"
     puppet.module_path = "vm/modules"
  end

  #config.vm.provision :shell, :path => "vm/shell/post-setup.sh"

end
