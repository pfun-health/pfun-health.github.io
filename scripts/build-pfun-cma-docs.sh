#!/bin/bash

# Build and serve documentation for pfun-cma-model submodule

set -e

# Check if submodule exists
if [ ! -d "docs/pfun-cma-model" ]; then
    echo "Error: pfun-cma-model submodule not found in docs/pfun-cma-model"
    exit 1
fi

# Navigate to submodule directory
cd docs/pfun-cma-model

# Check if zensical is installed, if not install it
if ! command -v zensical &> /dev/null; then
    echo "Installing zensical..."
    pip install zensical
fi

# Build the documentation
echo "Building documentation..."
zensical build --clean

# Copy built documentation to main site directory
echo "Copying built documentation to site/pfun-cma-model..."
mkdir -p ../../site/pfun-cma-model
cp -r site/* ../../site/pfun-cma-model/

echo "Documentation built successfully and copied to site/pfun-cma-model/"
echo "You can now serve the documentation from the main site."

# Return to main directory
cd ../..