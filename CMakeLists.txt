cmake_minimum_required(VERSION 3.10)
project(App C)

# Set Policy CMP0072 to NEW to use the modern GLVND libraries (removes that warning)
cmake_policy(SET CMP0072 NEW)

# 1. Find the required packages using the names vcpkg confirmed
find_package(GLEW CONFIG REQUIRED)  # Using CONFIG mode for vcpkg
find_package(glfw3 CONFIG REQUIRED)
find_package(OpenGL REQUIRED)

include_directories(include)

set(SOURCES 
    src/main.c
    src/util.c)

# --- GCC Security & "Unfaulty" Hardening ---

# Release: Max Security + Performance
set(SEC_FLAGS "-fstack-protector-strong -D_FORTIFY_SOURCE=2 -fPIE -pie")
set(LD_FLAGS "-Wl,-z,relro,-z,now")

set(CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE} -O2 ${SEC_FLAGS}")
set(CMAKE_EXE_LINKER_FLAGS_RELEASE "${CMAKE_EXE_LINKER_FLAGS_RELEASE} ${LD_FLAGS}")

# Debug: Bug Catching (Sanitizers)
# This will catch your manual memory management errors in the XOR AI
set(CMAKE_C_FLAGS_DEBUG "${CMAKE_C_FLAGS_DEBUG} -g -Og -Wall -Wextra -fsanitize=address -fsanitize=undefined")

# 2. Add your executable
add_executable(app ${SOURCES})

# 3. Link using the exact target names from the vcpkg output
target_link_libraries(app PRIVATE 
    GLEW::GLEW     # Note: Uppercase is usually required for the vcpkg target
    glfw           # vcpkg confirmed this is just 'glfw'
    OpenGL::GL     # Standard modern OpenGL target
)
