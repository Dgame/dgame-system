ANSIBLE_PKG = ansible
PLAYBOOK = ansible-playbook
PLAYBOOK_NAME = manjaro
INVENTORY = -i hosts
FLAGS = --ask-become-pass

check: install_ansible
	$(PLAYBOOK) --check $(FLAGS) $(INVENTORY) $(PLAYBOOK_NAME).yml
install: install_ansible
	$(PLAYBOOK) $(FLAGS) $(INVENTORY) $(PLAYBOOK_NAME).yml
install_ansible: rebuild_mirrors
	sudo pacman -S $(ANSIBLE_PKG) --needed --noconfirm
rebuild_mirrors:
	sudo pacman -Sy --noconfirm
test:
	molecule test -s $(PLAYBOOK_NAME)
converge:
	molecule converge -s $(PLAYBOOK_NAME)
