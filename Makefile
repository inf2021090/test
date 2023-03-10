# Define variables
VENV_NAME := .venv
PYTHON := $(VENV_NAME)/bin/python
REPO_NAME := https://github.com/inf2021090/test
IMAGE_NAME := my-social-media-app
VERSION := 1.0.0

# Set default target
all: venv check_repo docker sphinx commit

# Create virtual environment
venv:
	@echo "Creating virtual environment..."
	python3 -m venv $(VENV_NAME)
	$(PYTHON) -m pip install --upgrade pip setuptools

# Install project dependencies
install:
	@echo "Installing dependencies..."
	$(PYTHON) -m pip install -r requirements.txt

# Check if GitHub repository exists and download if necessary
check_repo:
	@echo "Checking for GitHub repository..."
	if ! git ls-remote https://github.com/your-github-username/$(REPO_NAME).git HEAD > /dev/null 2>&1; then \
		echo "Repository not found. Downloading from GitHub..."; \
		git clone https://github.com/your-github-username/$(REPO_NAME).git; \
	else \
		echo "Repository found."; \
	fi

# Build Docker image
docker:
	@echo "Building Docker image..."
	docker-compose build -t my-social-media-app

# Generate documentation with Sphinx
sphinx:
	@echo "Generating documentation with Sphinx..."
	cd docs && make html

# Commit changes with messages determined by user
commit:
	@echo "Committing changes..."
	read -p "Enter commit message: " message; \
	git add -A; \
	git commit -m "$$message"; \
	git push

# Clean up temporary files
clean:
	@echo "Cleaning up..."
	rm -rf $(VENV_NAME)
	rm -rf $(REPO_NAME)
	docker-compose down --rmi all
	cd docs && make clean
# Build settings
SPHINXOPTS    =
SPHINXBUILD   = sphinx-build
SOURCEDIR     = docs/source
BUILDDIR      = docs/build

# Targets
.PHONY: clean clean_docs docs

clean:
    rm -rf $(BUILDDIR)
    rm -rf dist/
    rm -rf *.egg-info

clean_docs:
    cd $(SOURCEDIR) && $(SPHINXBUILD) -b clean . $(BUILDDIR)

docs:
    cd $(SOURCEDIR) && $(SPHINXBUILD) -M html . $(BUILDDIR) $(SPHINXOPTS)

docs_upload:
    cd $(SOURCEDIR) && $(SPHINXBUILD) -M html . $(BUILDDIR) $(SPHINXOPTS)
    cd $(BUILDDIR) && zip -r $(PROJECT_NAME)-docs.zip ./*
    twine upload --skip-existing $(PROJECT_NAME)-docs.zip

venv:
    python3 -m venv venv
    . venv/bin/activate && pip install -r docs/requirements.txt

# Add dependencies for the 'docs' and 'docs_upload' targets
docs deps: venv

# Set the default target to 'docs_upload'
.DEFAULT_GOAL := docs_upload

.PHONY: all venv check_repo docker sphinx commit clean
