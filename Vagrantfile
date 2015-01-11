Vagrant.configure(2) do |config|
  config.vm.box = "vStone/centos-6.x-puppet.3.x"

  config.vm.provision :shell, inline: "yum install -y wget"

  config.vm.provision :shell, path: "shell/java.sh"

  config.vm.provision :shell, path: "shell/maven.sh"

  config.vm.provision :shell, path: "shell/node.sh"
  
  config.vm.provision :shell, inline: "yum install -y git"

  config.vm.network :forwarded_port, guest: 8080, host: 8080
  config.vm.network :forwarded_port, guest: 4200, host: 4200
  
  config.vm.provider :virtualbox do |vb|
    vb.customize [:modifyvm, :id, "--memory", "1024"]              
    vb.customize [:modifyvm, :id, "--usb", "off"]
    vb.customize [:modifyvm, :id, "--usbehci", "off"]
  end
end
