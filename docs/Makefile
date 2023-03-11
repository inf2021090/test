# Build settings
SPHINXOPTS    =
SPHINXBUILD   = sphinx-build
SOURCEDIR     = source
BUILDDIR      = ../build

# Targets
.PHONY: clean html

clean:
    rm -rf $(BUILDDIR)

html:
    $(SPHINXBUILD) -M html "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS)

# Set the default target to 'html'
.DEFAULT_GOAL := html
