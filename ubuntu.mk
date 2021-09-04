ANSIBLE_PKG = ansible
PLAYBOOK = ansible-playbook
OS_NAME = ubuntu
INVENTORY = -i hosts
FLAGS = --ask-become-pass

check: install_ansible
	$(PLAYBOOK) --check $(FLAGS) $(INVENTORY) $(OS_NAME).yml
install: install_ansible
	$(PLAYBOOK) $(FLAGS) $(INVENTORY) $(OS_NAME).yml
install-on-wsl: install_ansible
	$(PLAYBOOK) $(FLAGS) $(INVENTORY) wsl-$(OS_NAME).yml
install_ansible: update
	sudo apt-get -y install $(ANSIBLE_PKG)
update:
	sudo apt-get -y update
upgrade: update
	sudo apt-get -y dist-upgrade && sudo apt-get -y autoremove
test:
	molecule test -s $(OS_NAME)
converge:
	molecule converge -s $(OS_NAME)
idempotence:
	molecule idempotence -s $(OS_NAME)
destroy:
	molecule destroy -s $(OS_NAME)