ANSIBLE_PKG = ansible
PLAYBOOK = ansible-playbook
INVENTORY = -i hosts
FLAGS = --ask-become-pass

vagrant: install_ansible #install_yay
	$(PLAYBOOK) $(INVENTORY) localhost.yml
check: install_ansible #install_yay
	$(PLAYBOOK) --check $(FLAGS) $(INVENTORY) localhost.yml
install: install_ansible
	$(PLAYBOOK) $(FLAGS) $(INVENTORY) localhost.yml
install_ansible: update_cache
	yes | LC_ALL=en_US.UTF-8 sudo pacman -S $(ANSIBLE_PKG) --needed
install_utilities: update_cache
	yes | LC_ALL=en_US.UTF-8 sudo pacman -S binutils gcc pkg-config fakeroot --needed
update_cache:
	yes | LC_ALL=en_US.UTF-8 sudo pacman -Sy --needed
