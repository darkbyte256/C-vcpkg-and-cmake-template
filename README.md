# C-Vcpkg-CMake-Template

A professional-grade boilerplate for high-performance C applications. This template provides a robust, reproducible environment for prototyping low-latency systems, signal processing tools, or security utilities using modern C standards.

## 🚀 Overview

This repository standardizes the "Zero-to-Build" process for C projects. It integrates **CMake** for build orchestration and **vcpkg (Manifest Mode)** for dependency management, ensuring that the development environment is identical across different machines.

### Key Features
- **Modern C Workflow:** Configured for C11/C17 standards.
- **Dependency Management:** Uses `vcpkg.json` for reproducible, version-locked libraries.
- **Clang Integration:** Defaulted to `clang` for superior diagnostics and static analysis.
- **Automated Toolchain:** Includes scripts for submodule initialization and environment bootstrapping.
- **OpenGL Smoke-Test:** Includes a minimal "Hello Triangle" implementation to verify the linker and GPU driver paths are correctly mapped.

## 🛠️ Project Structure
```text
├── build.sh          # Automated bootstrap & build script
├── clean.sh          # Deep-clean script for artifacts & vcpkg cache
├── CMakeLists.txt    # Modern CMake configuration
├── vcpkg.json        # Dependency manifest (Manifest Mode)
├── include/          # Public headers
└── src/              # Source files
```

## 🚦 Getting Started

### Prerequisites
- **CMake** (3.10+)
- **Clang** or **GCC**
- **Git**
- **System Dependencies** (for the OpenGL smoke-test):
  - Ubuntu/Debian: `sudo apt install libx11-dev libxrandr-dev libxcursor-dev libxi-dev libgl1-mesa-dev`

### Setup & Build
The included `build.sh` script handles vcpkg bootstrapping and project configuration automatically:

```bash
chmod +x build.sh
./build.sh
```

### Running the Smoke-Test
After building, run the verification app:
```bash
./build/app
```

## 🔧 Customization
To use this as a base for a new project:
1. Update `project(YourProjectName C)` in `CMakeLists.txt`.
2. Add your required libraries to `vcpkg.json`.
3. Run `./build.sh` to fetch and link dependencies automatically.

---
*Maintained by Ramy Abdallah Mohamed.*
