prefix=/usr/local

# files that need mode 755
EXEC_FILES=vc

# files that need mode 644
SCRIPT_FILES =vc_common
SCRIPT_FILES+=vc-*

all:
	@echo "usage: make install"
	@echo "       make uninstall"

install:
	@command -v colordiff >/dev/null 2>&1 || (echo "'colordiff' not installed. Aborting."; exit 1)
	install -d -m 0755 $(prefix)/bin
	install -m 0755 $(EXEC_FILES) $(prefix)/bin
	install -m 0644 $(SCRIPT_FILES) $(prefix)/bin

uninstall:
	test -d $(prefix)/bin && \
	cd $(prefix)/bin && \
	rm -f $(EXEC_FILES) $(SCRIPT_FILES)
