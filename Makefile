.PHONY: init
init:
	@$(MAKE) _common-init

.PHONY: init-local
init-local:
	@$(MAKE) _common-init
	pre-commit install

.PHONY: _common-init
_common-init:
	@command -v uv >/dev/null 2>&1 || { \
		echo "uv not found, installing..."; \
		curl -LsSf https://astral.sh/uv/install.sh | sh; \
	}
	uv python install
	uv sync --extra dev


## companion tools
.PHONY: mlflow-ui
mlflow-ui:
	mlflow server --host 0.0.0.0 --port 8080


## testing targets
.PHONY: test
test:
	coverage run -m pytest --html=pytest_results.html --self-contained-html --alluredir pytest_allure
	# call the coverage target
	@$(MAKE) coverage-report

.PHONY: unit-test
unit-test:
	coverage run -m pytest --html=pytest_results.html --self-contained-html --alluredir pytest_allure tests/unit
	# call the coverage target
	@$(MAKE) coverage-report

.PHONY: coverage-report
coverage-report:
	coverage report --show-missing --skip-empty
	coverage xml
	coverage html -d coverage_html


## code quality targets
.PHONY: pre-commit-all
pre-commit-all:
	pre-commit run --all

.PHONY: code-quality
code-quality:
	pylint src
