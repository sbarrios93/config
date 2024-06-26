default: help

DARWIN_REBUILD := ./result/sw/bin/darwin-rebuild

.PHONY: deploy-work
deploy-work: ## Deploy work configuration
	./switch-environment.sh work
	make deploy

.PHONY: deploy-personal
deploy-personal: ## Deploy personal configuration
	./switch-environment.sh personal
	make deploy

.PHONY: deploy
deploy: $(DARWIN_REBUILD) ## Bootstrap
	$(DARWIN_REBUILD) switch \
		--flake .#aarch64-darwin \
		--option accept-flake-config true

.PHONY: fmt
fmt: ## Format code
	nix fmt --accept-flake-config

.PHONY: lint
lint: ## Lint code
	nix fmt --accept-flake-config -- --check .
	nix run github:astro/deadnix -- --fail
	nix flake check --all-systems --accept-flake-config

.PHONY: help
help: Makefile ## Print this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| sort \
		| awk 'BEGIN {FS = ":.*?## "}; \
		{printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
