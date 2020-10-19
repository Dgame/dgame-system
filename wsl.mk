ANSIBLE_PKG = ansible
PLAYBOOK = ansible-playbook
PLAYBOOK_FILE = wsl.yml
INVENTORY = -i hosts
FLAGS = --ask-become-pass

check: install_ansible
	$(PLAYBOOK) --check $(FLAGS) $(INVENTORY) $(PLAYBOOK_FILE)
install: install_ansible
	$(PLAYBOOK) $(FLAGS) $(INVENTORY) $(PLAYBOOK_FILE)
install_ansible: install_ansible_ppa
	sudo apt-get -y install $(ANSIBLE_PKG)
install_ansible_ppa: update
	sudo apt install software-properties-common
	sudo apt-add-repository -y --update ppa:ansible/ansible
update:
	sudo apt-get -y update
test:
	molecule test -s wsl
converge:
	molecule converge -s wsl
