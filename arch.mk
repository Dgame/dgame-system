ANSIBLE_PKG = ansible
PLAYBOOK = ansible-playbook
PLAYBOOK_FILE = localhost.yml
INVENTORY = -i hosts
FLAGS = --ask-become-pass

check: install_ansible
	$(PLAYBOOK) --check $(FLAGS) $(INVENTORY) $(PLAYBOOK_FILE)
install: install_ansible
	$(PLAYBOOK) $(FLAGS) $(INVENTORY) $(PLAYBOOK_FILE)
install_ansible: rebuild_mirrors
	yes j | sudo pacman -S $(ANSIBLE_PKG) --needed
rebuild_mirrors:
	yes j | sudo pacman -Sy
update:
	yay --save --nocleanmenu --nodiffmenu --answerclean All --answerdiff All --answeredit All --answerupgrade All
	yes j | sudo pacman -Syu && yay -Syu
test:
	molecule test