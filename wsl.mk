ANSIBLE_PKG = ansible
PLAYBOOK = ansible-playbook
PLAYBOOK_NAME = wsl
INVENTORY = -i hosts
FLAGS = --ask-become-pass

check: install_ansible
	$(PLAYBOOK) --check $(FLAGS) $(INVENTORY) $(PLAYBOOK_NAME).yml
install: install_ansible
	$(PLAYBOOK) $(FLAGS) $(INVENTORY) $(PLAYBOOK_NAME).yml
install_ansible: install_ansible_ppa
	sudo apt-get -y install $(ANSIBLE_PKG)
install_ansible_ppa: update
	sudo apt install software-properties-common
	sudo apt-add-repository -y --update ppa:ansible/ansible
update:
	sudo apt-get -y update
test:
	molecule test -s $(PLAYBOOK_NAME)
converge:
	molecule converge -s $(PLAYBOOK_NAME)
