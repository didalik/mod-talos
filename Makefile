SUBMODULE ?= talos

pull:
	@cd ${SUBMODULE};git reset;[ "$$(git pull)" = 'Already up to date.' ] && ../bin/undo-reset ${SUBMODULE}
