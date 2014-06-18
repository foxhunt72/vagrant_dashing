# Dashing vagrant file

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.define :dashing01 do |dashing01_config|
      dashing01_config.vm.box  = "ubuntu1404"
      dashing01_config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"
      dashing01_config.vm.host_name  = "dashing-ubuntu"
      dashing01_config.vm.provision "shell", path: "install_dashing.sh"
  end
  config.vm.network :forwarded_port, guest: 3030, host: 8330
end
