# Import the Django settings module
import os
import sys
import django

sys.path.insert(0, os.path.abspath('..'))
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'my_django_project.settings')
django.setup()

# Project information
project = 'My Django Project'
author = 'Your Name'

# General configuration
extensions = ['sphinx.ext.autodoc', 'sphinx.ext.napoleon']
templates_path = ['_templates']
exclude_patterns = ['_build', 'Thumbs.db', '.DS_Store']
html_theme = 'sphinx_rtd_theme'
html_static_path = ['_static']

# Autodoc settings
autodoc_mock_imports = ['django']

# Napoleon settings
napoleon_use_rtype = False
napoleon_use_param = False

# Load the Django settings module in the master document
master_doc = 'index'
