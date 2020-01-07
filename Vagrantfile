Vagrant.require_version ">= 2.1.0"

Vagrant.configure(2) do |config|
    config.vm.define "archlinux" do |arch|
        arch.vm.box = "archlinux/archlinux"
    
        arch.vm.provision "test", type: "shell", inline: "cd /vagrant && make -f arch vagrant", privileged: false
    end
    
    config.vm.define "manjaro" do |manjaro|
        manjaro.vm.box = "amigcamel/manjaro-gnome-18.0.4"
        
        manjaro.vm.provision "test", type: "shell", inline: "cd /vagrant && make -f arch vagrant", privileged: false
    end
end