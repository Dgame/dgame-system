ANSIBLE_PKG = ansible
PLAYBOOK = ansible-playbook
PLAYBOOK_NAME = arch
INVENTORY = -i hosts
FLAGS = --ask-become-pass

check: install_ansible
	$(PLAYBOOK) --check $(FLAGS) $(INVENTORY) $(PLAYBOOK_NAME).yml
install: install_ansible
	$(PLAYBOOK) $(FLAGS) $(INVENTORY) $(PLAYBOOK_NAME).yml
install_ansible: rebuild_mirrors
	yes j | sudo pacman -S $(ANSIBLE_PKG) --needed
rebuild_mirrors:
	yes j | sudo pacman -Sy
test:
	molecule test -s $(PLAYBOOK_NAME)
converge:
	molecule converge -s $(PLAYBOOK_NAME)
