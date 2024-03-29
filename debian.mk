ANSIBLE_PKG = ansible
PLAYBOOK = ansible-playbook
OS_NAME = debian
INVENTORY = -i hosts
FLAGS = --ask-become-pass

check: install_ansible
	$(PLAYBOOK) --check $(FLAGS) $(INVENTORY) $(OS_NAME).yml
install: install_ansible
	$(PLAYBOOK) $(FLAGS) $(INVENTORY) $(OS_NAME).yml
install-on-wsl: install_ansible
	$(PLAYBOOK) $(FLAGS) $(INVENTORY) wsl-$(OS_NAME).yml
install_ansible: update
	sudo apt-get -y install software-properties-common
	sudo add-apt-repository --yes --update ppa:ansible/ansible
	sudo apt-get -y install $(ANSIBLE_PKG)
update:
	sudo apt-get -y update
upgrade: update
	sudo apt-get -y dist-upgrade && sudo apt-get -y autoremove
test:
	molecule test -s wsl-$(OS_NAME)
converge:
	molecule converge -s wsl-$(OS_NAME)
idempotence:
	molecule idempotence -s wsl-$(OS_NAME)
destroy:
	molecule destroy -s wsl-$(OS_NAME)