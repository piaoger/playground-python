
Vagrant.configure(2) do |config|

  # for bad network condition, using local box cache instead
  config.vm.box = "xenial-server-cloudimg-amd64-vagrant-local"
  # config.vm.box = "xenial"
  # config.vm.box_url = "https://cloud-images.ubuntu.com/xenial/current/xenial-server-cloudimg-amd64-vagrant.box"

  config.vm.hostname = "bootstrap"

  # https://www.vagrantup.com/docs/synced-folders/basic_usage.html
  # config.vm.synced_folder ".", "/vagrant", owner: "root", group: "root"
  config.vm.synced_folder ".", "/vagrant"

  config.vm.network "forwarded_port", guest: 8000, host: 8031

  config.vm.provision "shell", path: "provision.sh" , privileged: false
end

