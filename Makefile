# Makefile

HEADING_PRINTER := $(shell which heading || echo 'true')
SOURCE_FILES    := $(wildcard **/*.lisp)

SBCL            := $(shell which sbcl || echo 'sbcl')
CCL             := $(shell which ccl || echo 'ccl')
ECL             := $(shell which ecl || echo 'ecl')
ABCL            := $(shell which abcl || echo 'abcl')

# Documentation ---------------------------------------------------------------

docs: $(SOURCE_FILES)
	$(SBCL) --noinform \
		--eval "(ql:quickload :coo)" \
		--eval "(ql:quickload :tammymakesthings)" \
		--eval "(coo:document-system :tammymakesthings :keep-rst t)" \
		--quit

# Testing ---------------------------------------------------------------------
test:
	$(HEADING_PRINTER) computer 'SBCL'
	$(SBCL) --load test/run.lisp

.PHONY: docs test 
