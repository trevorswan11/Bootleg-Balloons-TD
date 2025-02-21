cmake_minimum_required(VERSION 3.10)
project(BloonsTD)

# Set C++ standard and build system
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_TOOLCHAIN_FILE "C:/Users/Trevor/vcpkg/scripts/buildsystems/vcpkg.cmake" CACHE STRING "Vcpkg toolchain file")

# Find required packages
find_package(OpenGL REQUIRED)
find_package(glfw3 REQUIRED)
find_package(GLEW REQUIRED)

# Add source files
add_executable(BloonsTD
    src/main.cpp
    utils/Logger.cpp    
)

# Link libraries
target_link_libraries(BloonsTD OpenGL::GL glfw GLEW::GLEW)
include_directories(${CMAKE_SOURCE_DIR}/utils)
