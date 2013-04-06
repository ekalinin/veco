prefix=/usr/local

# files that need mode 755
EXEC_FILES=vc

# files that need mode 644
SCRIPT_FILES =commands/vc_common
SCRIPT_FILES+=commands/vc-*

all:
	@echo "usage: make install"
	@echo "       make uninstall"

install:
	@install -d -m 0755 $(prefix)/bin
	@# delete prev installation
	@rm -rf $(prefix)/bin/commands
	@install -d -m 0755 $(prefix)/bin/commands
	@install -m 0755 $(EXEC_FILES) $(prefix)/bin
	@install -m 0644 $(SCRIPT_FILES) $(prefix)/bin/commands

install-local:
	@make install prefix=~
	@echo "Please, add into your ~/.bashrc:"
	@echo ""
	@echo "# set PATH so it includes user's private bin if it exists"
	@echo 'if [ -d "$$HOME/bin" ] ; then'
	@echo '    PATH="$$HOME/bin:$$PATH"'
	@echo "fi"

install-completion:
	@install -m 0644 bash_completion/vc /etc/bash_completion.d

install-completion-local:
	@install -d -m 0755 ~/bash_completion.d
	@install -m 0644 bash_completion/vc ~/bash_completion.d
	@echo "Please, add into your ~/.bashrc:"
	@echo ""
	@echo 'if [ -f "$$HOME/bash_completion.d/vc" ] ; then'
	@echo '    . $$HOME/bash_completion.d/vc'
	@echo "fi"

uninstall:
	@test -d $(prefix)/bin && \
	cd $(prefix)/bin && \
	rm -f $(EXEC_FILES) $(SCRIPT_FILES) && \
	rm -f /etc/bash_completion.d/vc
	@echo "Done."

release:
	@git tag `grep "VECO_VERSION=" commands/vc-version  | grep -o -E '[0-9]\.[0-9]\.[0-9]{1,2}'`
	@git push --tags origin master

