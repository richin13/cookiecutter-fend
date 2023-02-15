.PHONY: help
help: ## Print each target and its associated help message
	@grep -E '^[%a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) |  \
		awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: build
build: ## Build all the containers
	docker compose build

.PHONY: run
run: stop ## Run all the containers using docker compose
	docker compose up

.PHONY: stop
stop: ## Stop all the running containers
	docker compose down -v --remove-orphans

.PHONY: ssh-%
ssh-%: ## Open an interactive shell in the target container (replace % with the service name)
	docker compose run -it --entrypoint="" $* bash

.PHONY: restart-%
restart-%: ## Restart a specific service (replace % with the service name)
	docker compose restart $*

.PHONY: refresh-%
refresh-%: stop ## Refresh a specific service by re-building and restarting (replace % with the service name)
	docker compose build $*
	#: Restart everyting just in case
	docker compose up
