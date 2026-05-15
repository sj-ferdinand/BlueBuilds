#!/usr/bin/env bash

# Tell this script to exit if there are any errors.
# You should have this in every custom script, to ensure that your completed
# builds actually ran successfully without any errors!
set -oue pipefail

# Your code goes here.
git clone https://github.com/FyraLabs/PackageKit-bootc.git
cd PackageKit-bootc
git submodule update --init --recursive
meson setup builddir
meson compile -C builddir

sudo meson install -C builddir
