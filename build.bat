@echo off
rmdir /s /q build
mkdir build
cd build
cmake .. -DCMAKE_TOOLCHAIN_FILE=%userprofile%\vcpkg\scripts\buildsystems\vcpkg.cmake
cmake --build .
cd ..