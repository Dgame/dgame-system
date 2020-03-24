Vagrant.configure("2") do |config|
  config.vm.box = "tranchung/manjaro-gnome-x64-19.0"

  config.vm.provision "shell", inline: "pacman -Sy && pacman -S make --needed --noconfirm"
  config.vm.provision "test", type: "shell", inline: "cd /vagrant && make vagrant", privileged: false

  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--usb", "off"]
    vb.customize ["modifyvm", :id, "--usbehci", "off"]
  end
end
