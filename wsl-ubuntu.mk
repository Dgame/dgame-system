ANSIBLE_PKG = ansible
PLAYBOOK = ansible-playbook
PLAYBOOK_NAME = wsl-ubuntu
INVENTORY = -i hosts
FLAGS = --ask-become-pass

check: install_ansible
	$(PLAYBOOK) --check $(FLAGS) $(INVENTORY) $(PLAYBOOK_NAME).yml
install: install_ansible
	$(PLAYBOOK) $(FLAGS) $(INVENTORY) $(PLAYBOOK_NAME).yml
install_ansible: update
	sudo apt-get -y install $(ANSIBLE_PKG)
update:
	sudo apt-get -y update
upgrade: update
	sudo apt-get -y dist-upgrade && sudo apt-get -y autoremove
test:
	molecule test -s $(PLAYBOOK_NAME)
converge:
	molecule converge -s $(PLAYBOOK_NAME)
idempotence:
	molecule idempotence -s $(PLAYBOOK_NAME)
