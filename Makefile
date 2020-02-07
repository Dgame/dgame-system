up:
	vagrant up $(os)
again:
	vagrant reload $(os)
test:
	vagrant provision $(os) --provision-with test
down:
	vagrant destroy $(os) --force