@echo off
cd /d %~dp0

title Checking Python installation...
python --version > nul 2>&1
if %errorlevel% neq 0 (
    echo Python is not installed! (Go to https://www.python.org/downloads and install the latest version.^)
    echo Make sure it is added to PATH.
    goto ERROR
)

title Activating Virtual Env
call env\Scripts\activate

title Checking libraries...
echo Checking 'customtkinter' (1/6)
python -c "import customtkinter" > nul 2>&1
if %errorlevel% neq 0 (
    echo Installing customtkinter...
    python -m pip install customtkinter > nul
)

echo Checking 'pillow' (2/6)
python -c "import PIL" > nul 2>&1
if %errorlevel% neq 0 (
    echo Installing pillow...
    python -m pip install pillow > nul
)

echo Checking 'cryptography' (3/6)
python -c "import cryptography" > nul 2>&1
if %errorlevel% neq 0 (
    echo Installing cryptography...
    python -m pip install cryptography > nul
)

echo Checking 'urllib3' (4/6)
python -c "import urllib3" > nul 2>&1
if %errorlevel% neq 0 (
    echo Installing urllib3...
    python -m pip install urllib3 > nul
)

echo Checking 'pyinstaller' (5/6)
python -c "import pyinstaller" > nul 2>&1
if %errorlevel% neq 0 (
    echo Installing pyinstaller...
    python -m pip install pyinstaller > nul
)

echo Checking 'lzma' (6/6)
python -c "import lzma" > nul 2>&1
if %errorlevel% neq 0 (
    echo Installing lzma...
    python -m pip install lzma > nul
)

cls
title Starting builder...
python gui.py
if %errorlevel% neq 0 goto ERROR
exit

:ERROR
color 4 && title [Error]
pause > nul
