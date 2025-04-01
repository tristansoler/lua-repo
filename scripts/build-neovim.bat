@echo off
echo Neovim Build Helper

:: Setup Lua environment
call "%~dp0setup-env.bat"

:: Create build directory
if not exist "%CD%\build" mkdir build
cd build

:: Configure with CMake
echo Configuring Neovim build with CMake...
cmake -G Ninja ^
    -DCMAKE_BUILD_TYPE=RelWithDebInfo ^
    -DLUA_INCLUDE_DIR=%LUA_INCLUDE_DIR% ^
    -DLUA_LIBRARY=%LUA_LIBRARY% ^
    ..

:: Build Neovim
echo Building Neovim...
cmake --build .

echo.
if %ERRORLEVEL% EQU 0 (
    echo Neovim build completed successfully!
) else (
    echo Build failed with error code: %ERRORLEVEL%
)

cd ..
