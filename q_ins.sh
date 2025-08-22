#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

echo "--- Starting Qutip Installation Script ---"

# --- Step 1: Navigate to Documents and clone the Qutip repository ---
echo "Cloning Qutip repository..."
git clone https://github.com/qutip/qutip
echo "Qutip repository cloned."

# --- Step 2: Change into the Qutip project directory ---
cd qutip

# --- Step 3: Manually add setuptools and matplotlib to requirements.txt ---
echo "Adding setuptools and matplotlib to requirements.txt..."
echo "setuptools" >> requirements.txt
echo "matplotlib" >> requirements.txt
echo "requirements.txt updated."

# --- Step 4: Create and activate the virtual environment inside the project directory ---
# This creates a 'venv' subdirectory within the 'qutip' project folder.
echo "Creating and activating project virtual environment (inside qutip directory)..."
python3 -m venv venv
source venv/bin/activate
echo "Virtual environment activated."

# --- Step 5: Install dependencies from requirements.txt, including setuptools and matplotlib ---
echo "Installing Python dependencies from requirements.txt (including setuptools and matplotlib)..."
pip install -r requirements.txt
echo "All specified dependencies installed."

# --- Step 6: Ensure Python development headers are present (assumed pre-installed) ---
# Python.h is crucial for compiling C/C++ extensions. This script assumes it's already installed.
echo "Assuming python3-devel (Python development headers) is already installed system-wide."

# --- Step 7: Run the Qutip setup.py install command ---
# This builds and installs the Qutip library into the active virtual environment.
echo "Building and installing Qutip library..."
python3 setup.py install
echo "Qutip library successfully installed."

# --- Step 8: Clean up build artifacts (optional but recommended) ---
# These are temporary files generated during compilation.
echo "Cleaning up temporary build files..."
rm -rf build/
echo "Temporary build files removed."

# --- Step 9: Verify Qutip import from outside the source directory ---
echo "Verifying Qutip import from a non-source directory..."
cd .. # Move up to execute
python3 -c "import qutip"
echo "Qutip import successful."

# --- Step 10: Print the example script command to the terminal ---
echo "Example Qutip script command:"
echo "python3 tutorials/scripts/ex_01_simple_qobj.py"
echo "Example script command printed."

echo "--- Script finished successfully ---"

# Summary of Installed Packages
# 
# System-level Packages (installed with `sudo xbps-install -S`)
# 
# These packages provide core system functionalities, development headers, and graphical libraries that your Python environment relies on.
# 
# * python3-pip: The package installer for Python 3. (Though often pre-installed or required early on.)
# 
# * python3-devel: Provides the Python C header files (`Python.h`) essential for compiling Python extensions written in C or Cython, which QuTiP uses.
# 
# * tk-devel: Supplies the underlying Tcl/Tk graphical libraries that the Python `tkinter` module interfaces with.
# 
# * python3-tkinter: Provides the actual `tkinter` module for Python 3, enabling `matplotlib` to create interactive GUI windows for plots.
# 
# Python Packages (installed with `pip install -r requirements.txt` within your virtual environment)
# 
# These packages are specific to your QuTiP project and are isolated within your virtual environment, ensuring no conflicts with other Python projects or your system's global Python installation.
# 
# * cython: A dependency for QuTiP, used for compiling Python code to C for performance.
# 
# * numpy: A fundamental package for numerical computing in Python, a core dependency for scientific libraries.
# 
# * scipy: A library for scientific and technical computing, another key dependency for QuTiP.
# 
# * packaging: A utility for parsing and working with Python package versions.
# 
# * setuptools: Essential for building and installing Python packages, especially those with `setup.py` scripts like QuTiP. (You explicitly added this to `requirements.txt`).
# 
# * matplotlib: The primary plotting library in Python, necessary for QuTiP's visualization features. (You explicitly added this to `requirements.txt`).
