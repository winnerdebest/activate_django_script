@echo off
setlocal enabledelayedexpansion

set "ENV_DIR=env"
set "REQ_FILE=requirements.txt"
set "REQ_META=.req_meta"

echo [*] Checking for virtual environment...

if not exist "%ENV_DIR%\" (
    echo [!] Virtual environment not found.

    echo [*] Checking if virtualenv is installed...
    pip show virtualenv >nul 2>&1
    if errorlevel 1 (
        echo [*] Installing virtualenv...
        pip install virtualenv
    ) else (
        echo [*] virtualenv is already installed.
    )

    echo [*] Creating virtual environment...
    virtualenv %ENV_DIR%
)

:: Activate virtual environment
call %ENV_DIR%\Scripts\activate.bat

:: Generate metadata for requirements.txt (size + last modified time)
for %%I in (%REQ_FILE%) do (
    set "REQ_SIZE=%%~zI"
    set "REQ_TIME=%%~tI"
)
set "REQ_SUM=!REQ_SIZE!_!REQ_TIME!"

:: Check if requirements.txt changed
set "INSTALL_REQS=1"
if exist "%REQ_META%" (
    set /p OLD_SUM=<%REQ_META%
    if "!OLD_SUM!"=="!REQ_SUM!" (
        echo [*] requirements.txt hasn't changed. Skipping pip install.
        set "INSTALL_REQS=0"
    )
)

if "!INSTALL_REQS!"=="1" (
    echo [*] Installing dependencies from requirements.txt...
    pip install -r %REQ_FILE%
    echo !REQ_SUM! > %REQ_META%
)

:: Open browser to Django dev server
start http://127.0.0.1:8000

echo [*] Starting Django server...
python manage.py runserver

pause
endlocal
