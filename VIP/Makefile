# Makefile for setting up and managing virtual environment

# Set up virtual environment
venv:
	@echo "Creating virtual environment..."
	python3 -m venv venv
	@echo "Virtual environment created."

# Activate virtual environment
activate:
	@echo "Activating virtual environment..."
	. venv/bin/activate
	@echo "Virtual environment activated."

# Install dependencies from requirements.txt
install:
	@echo "Installing dependencies from requirements.txt..."
	venv/bin/pip install -r requirements.txt
	@echo "Dependencies installed."

# Add dependencies to requirements.txt
add:
	@echo "Enter package name (e.g. django==3.2.9) or CTRL+C to exit:"
	@read package; \
	venv/bin/pip install $$package; \
	venv/bin/pip freeze > requirements.txt; \
	@echo "Package added to requirements.txt."

# Update requirements.txt with latest package versions
update:
	@echo "Updating requirements.txt..."
	venv/bin/pip freeze --exclude-editable > requirements.txt
	@echo "Requirements updated."

# Help command
help:
	@echo "Usage: make [command]"
	@echo ""
	@echo "Commands:"
	@echo "  venv          Set up virtual environment"
	@echo "  activate      Activate virtual environment"
	@echo "  install       Install dependencies from requirements.txt"
	@echo "  add           Add a package to requirements.txt"
	@echo "  update        Update requirements.txt with latest package versions"
	@echo "  clean         Delete virtual environment"
	@echo "  help          Show help message"

# Clean virtual environment
clean:
	@echo "Deleting virtual environment..."
	rm -rf venv
	@echo "Virtual environment deleted."

