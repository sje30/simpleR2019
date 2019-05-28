## Simple makefile to rerun R scripts


## Find out which files we wish to regenerate
TARGETS := $(shell cat MANIFEST)


$(TARGETS): simpleR.R
	R CMD BATCH simpleR.R


.PHONY: all clean

all: $(TARGETS)

clean:
	rm -f $(TARGETS)


