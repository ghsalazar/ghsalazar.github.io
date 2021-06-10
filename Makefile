all:
	make -C assets/figures

.PHONNY: distclean clean

distclean:
	make -C assets/figures distclean

clean: distclean
	make -C assets/figures clean
