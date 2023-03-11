# Define the target directory for the generated documentation
DOCS_DIR = docs

# Define the name of the virtual environment for Sphinx
SPHINX_VENV = sphinx_venv

# Define the name of the project
PROJECT_NAME = my_django_project

.PHONY: docs

# Generate the documentation
docs:
    # Create a virtual environment for Sphinx
    python3 -m venv $(SPHINX_VENV)
    # Activate the virtual environment
    . $(SPHINX_VENV)/bin/activate
    # Install Sphinx and the necessary dependencies
    pip install -r $(DOCS_DIR)/requirements.txt
    # Generate the documentation
    cd $(DOCS_DIR) && make html

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
