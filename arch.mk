ANSIBLE_PKG = ansible
PLAYBOOK = ansible-playbook
OS_NAME = arch
INVENTORY = -i hosts
FLAGS = --ask-become-pass

check: install_ansible
	$(PLAYBOOK) --check $(FLAGS) $(INVENTORY) $(OS_NAME).yml
install: install_ansible
	$(PLAYBOOK) $(FLAGS) $(INVENTORY) $(OS_NAME).yml
install-on-wsl: install_ansible
	$(PLAYBOOK) $(FLAGS) $(INVENTORY) wsl-$(OS_NAME).yml
install_ansible: rebuild_mirrors
	sudo pacman -S $(ANSIBLE_PKG) --needed --noconfirm
rebuild_mirrors:
	sudo pacman -Sy --noconfirm
test:
	molecule test -s $(OS_NAME)
converge:
	molecule converge -s $(OS_NAME)
idempotence:
	molecule idempotence -s $(OS_NAME)
