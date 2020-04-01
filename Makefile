new-test: kill-test
	vagrant up
test-reload:
	vagrant reload
test-again:
	vagrant provision --provision-with test
kill-test:
	vagrant destroy --force
check:
	make -f arch.mk check
install:
	make -f arch.mk install
vagrant:
	make -f arch.mk vagrant
