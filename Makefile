up:
	vagrant up $(os)
again:
	vagrant reload $(os)
test:
	vagrant provision $(os) --provision-with test
down:
	vagrant destroy $(os) --force
install:
	make -f arch install
check:
	make -f arch check
