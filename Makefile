new-test: kill-test
	vagrant up $(os)
test-reload:
ifndef os
	$(error "No OS supplied")
endif
	vagrant reload $(os)
test-again:
ifndef os
	$(error "No OS supplied")
endif
	vagrant provision $(os) --provision-with test
kill-test:
	vagrant destroy $(os) --force
install:
	make -f arch install
check:
	make -f arch check
