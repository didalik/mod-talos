SUBMODULE ?= talos

define HELP_MENU_HEADER

  The mod-talos project follows the Talos project. The Talos project is superb.
  We here are just trying to learn from it.

endef

export HELP_MENU_HEADER

.PHONY: pull
pull: ## Pull the latest from ${SUBMODULE}
	@cd ${SUBMODULE};git reset --hard; rm -f GNUmakefile; \
		[ "$$(git pull)" = 'Already up to date.' ] && ../bin/undo-reset ${SUBMODULE} || echo OK; \
		make

help: ## This help menu.
	@echo "$$HELP_MENU_HEADER"
	@grep -E '^[a-zA-Z0-9%_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-10s\033[0m %s\n", $$1, $$2}'

.PHONY: sb 
sb: clean sandbox ## Reset the sandbox and run make there.
	@$(MAKE) -C sandbox

.PHONY: sandbox
sandbox: ## Init the sandbox.
	@mkdir sandbox
	@cp Makefile_sandbox sandbox/Makefile
	@cp Dockerfile_sandbox sandbox/Dockerfile

.PHONY: clean
clean: ## Clean up the sandbox.
	@-rm -rf sandbox

