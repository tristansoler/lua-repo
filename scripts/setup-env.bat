@echo off
echo Setting up Lua 5.1 environment for Neovim build...

:: Get the repository root directory
set REPO_ROOT=%~dp0..

:: Set Lua paths
set LUA_DIR=%REPO_ROOT%\lua
set LUA_PATH=%LUA_DIR%\?.lua;%LUA_DIR%\?\init.lua
set LUA_CPATH=%LUA_DIR%\?.dll

:: Add Lua to the PATH
set PATH=%LUA_DIR%\bin;%PATH%

:: Set environment variables for CMake to find Lua
set LUA_INCLUDE_DIR=%LUA_DIR%\include
set LUA_LIBRARY=%LUA_DIR%\lib\lua5.1.lib

echo Lua 5.1 environment configured successfully!
echo.
echo You can now run build-neovim.bat or manually run CMake.
