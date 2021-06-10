SRC_DIR = ../../_src

TARGETS = $(patsubst %.mp, %-1.svg, $(notdir $(wildcard $(SRC_DIR)/*.mp)))

all: $(TARGETS)
	
%-1.svg: $(SRC_DIR)/%.mp
	ln -s $< .
	mpost $(notdir $<)
	rm $(notdir $<)

.PHONNEY: clean distclean

distclean:
	rm -f *.log *.mpx

clean: distclean
	rm -f $(TARGETS)
