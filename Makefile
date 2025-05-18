SUBMODULE ?= talos

tmp:
	@echo ${ARCH}

pull:
	@cd ${SUBMODULE};git reset --hard; rm -f GNUmakefile; \
		[ "$$(git pull)" = 'Already up to date.' ] && ../bin/undo-reset ${SUBMODULE} || echo OK
