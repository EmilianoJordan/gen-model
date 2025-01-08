sources = model-gen tests

.PHONY: .uv  ## Check that uv is installed
.uv:
	@uv -V || echo 'Please install uv: https://docs.astral.sh/uv/getting-started/installation/'

.PHONY: install  # Install all dependencies and pre-commit
install: .uv
	uv sync --frozen --group all --all-extras
	uv run pre-commit install --install-hooks

.PHONY: lint  ## Lint python source files
lint: .uv
	uv run ruff check $(sources)
	uv run ruff format --check $(sources)
