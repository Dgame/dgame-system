ANSIBLE_PKG = ansible
PLAYBOOK = ansible-playbook
PLAYBOOK_FILE = wsl.yml
INVENTORY = -i hosts
FLAGS = --ask-become-pass

check: install_ansible
	$(PLAYBOOK) --check $(FLAGS) $(INVENTORY) $(PLAYBOOK_FILE)
install: install_ansible
	$(PLAYBOOK) $(FLAGS) $(INVENTORY) $(PLAYBOOK_FILE)
install_ansible: update
	sudo apt-get -y install $(ANSIBLE_PKG)
update:
	sudo apt-get -y update
test:
	molecule test