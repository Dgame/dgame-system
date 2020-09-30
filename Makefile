check:
	make -f arch.mk check
install:
	make -f arch.mk install
test:
	molecule test
