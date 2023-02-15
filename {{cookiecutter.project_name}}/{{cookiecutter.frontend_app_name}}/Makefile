.PHONY: help
help: ## Print available targets and their help messages
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) |  \
		awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: setup
setup: ## Install the dependencies using poetry and enables pre-commit hooks
	@npm install
