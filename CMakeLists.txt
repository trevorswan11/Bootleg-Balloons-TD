cmake_minimum_required(VERSION 3.10)
project(BloonsTD)

# Set C++ standard
set(CMAKE_CXX_STANDARD 17)

# Find required packages
find_package(OpenGL REQUIRED)
find_package(glfw3 REQUIRED)
find_package(GLEW REQUIRED)

# Add source files
add_executable(BloonsTD src/main.cpp)

# Link libraries
target_link_libraries(BloonsTD OpenGL::GL glfw GLEW::GLEW)
