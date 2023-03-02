.ONESHELL:
.PHONY: help setup venv install scripts format lint-blue lint-isort link-prospect lint security tests clean

ACTIVATE_LINUX=. venv/bin/activate
INSTALL_PACKAGES=pip install -r requirements.txt

help: ## Short description to make targets
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' Makefile | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-10s\033[0m %s\n", $$1, $$2}'

setup: clean venv install scripts ## Initial project setup with package installation and needed scripts

venv: ## Create python virtual environment in 'venv' folder
	@echo "Creating python virtual environment in 'venv' folder..."
	@python3 -m venv venv

install: ## Install python packages
	@echo "Installing python packages..."
	@$(ACTIVATE_LINUX)
	@$(INSTALL_PACKAGES)

tests: ## Run python tests
	@echo "Running python tests..."
	@$(ACTIVATE_LINUX)
	@pytest -v

gh-deploy-mkdocs: ## Deploy docs
	@echo "Running mkdocs gh-deploy..."
	@$(ACTIVATE_LINUX)
	@mkdocs gh-deploy

gh-deploy-mike: ## Deploy docs
	@echo "Running mike deploy..."
	@$(ACTIVATE_LINUX)
	@mike deploy --push --update-aliases 0.1 latest

serve: ## Start mkdocs server
	@echo "Starting mkdocs server"
	@mkdocs serve -a 0.0.0.0:8000

clean: ## Clean previous python virtual environment
	@echo "Cleaning previous python virtual environment..."
	@rm -rf venv