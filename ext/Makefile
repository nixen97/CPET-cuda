PROJECTS := Lib Test

.PHONY: all clean help $(PROJECTS) 

all: $(PROJECTS)

Lib:
	@echo "==== Building Lib ($(Lib_config)) ===="
	@${MAKE} --no-print-directory -C src -f Makefile config=$(Lib_config)

Test: Lib
	@echo "==== Building Test ($(Test_config)) ===="
	@${MAKE} --no-print-directory -C test -f Makefile config=$(Test_config)

clean:
	@${MAKE} --no-print-directory -C src -f Makefile clean
	@${MAKE} --no-print-directory -C test -f Makefile clean

help:
	@echo "Usage: make [config=name] [target]"
	@echo ""
	@echo "TARGETS:"
	@echo "   all (default)"
	@echo "   clean"
	@echo "   Lib"
	@echo "   Test"