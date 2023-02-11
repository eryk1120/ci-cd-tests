.PHONY: lint
lint:
	@echo "Running black linter..."
	black ./src
	@echo "Running isort linter..."
	isort ./src


pre_commit:
	@echo "Manually unning pre commit hooks"
	pre-commit run --all-files
