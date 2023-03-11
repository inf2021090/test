# Define the target directory for the generated documentation
DOCS_DIR = docs1

# Define the name of the virtual environment for Sphinx
SPHINX_VENV = $(DOCS_DIR)/sphinx_venv

# Define the name of the project
PROJECT_NAME = my_django_project

# Define the location of the requirements file
REQUIREMENTS_FILE = docs/requirements.txt

.PHONY: docs

# Generate the documentation
docs: $(SPHINX_VENV)
	. $(SPHINX_VENV)/bin/activate && \
		pip install -r $(REQUIREMENTS_FILE) && \
		cd $(DOCS_DIR) && make html

$(SPHINX_VENV):
	# Create a virtual environment for Sphinx
	python3 -m venv $(SPHINX_VENV)

.PHONY: upload

# Upload the documentation to Read the Docs
upload:
	# Authenticate with Read the Docs
	readthedocs-cli login --token=39f26421dc105e0503639fc73f0069bf40f4e9d8
	# Upload the documentation
	readthedocs-cli upload $(PROJECT_NAME)

.PHONY: clean

# Clean up the generated documentation and virtual environment
clean:
	rm -rf $(DOCS_DIR)/build/
	rm -rf $(SPHINX_VENV)
