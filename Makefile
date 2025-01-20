.PHONY: build publish test clean install-dev

PYTHON := python3.11
PIP := $(PYTHON) -m pip

build:
	$(PYTHON) -m build

publish:
	$(PYTHON) -m twine upload dist/*

test:
	pytest -v

coverage:
	pytest --cov=your_utils tests/

clean:
	rm -rf dist/ build/ *.egg-info/
	find . -type d -name __pycache__ -exec rm -rf {} +

install-dev:
	$(PIP) install -e ".[test]"