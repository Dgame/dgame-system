ANSIBLE_PKG = ansible
PLAYBOOK = ansible-playbook
INVENTORY = -i hosts
FLAGS = --ask-become-pass

check: install_ansible
	$(PLAYBOOK) --check $(FLAGS) $(INVENTORY) localhost.yml
install: install_ansible
	$(PLAYBOOK) $(FLAGS) $(INVENTORY) localhost.yml
install_ansible: update_cache
	yes j | sudo pacman -S $(ANSIBLE_PKG) --needed
update_cache:
	yes j | sudo pacman -Sy
