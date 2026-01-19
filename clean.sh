#!/bin/bash

# Define directories to remove
BUILD_DIR="build"
VCPKG_INSTALLED="vcpkg_installed"

echo "--- Cleaning Project ---"

# Remove CMake build artifacts
if [ -d "$BUILD_DIR" ]; then
    echo "Removing $BUILD_DIR..."
    rm -rf "$BUILD_DIR"
fi

# Remove vcpkg local installs (the heavy stuff)
if [ -d "$VCPKG_INSTALLED" ]; then
    echo "Removing $VCPKG_INSTALLED..."
    rm -rf "$VCPKG_INSTALLED"
fi

echo "--- Clean Complete! ---"
echo "Your project is now slim and ready for upload."