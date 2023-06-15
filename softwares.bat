@echo off
setlocal enabledelayedexpansion

rem Add the software names to check
set "softwareList=NetBeans Apache Visual Studio Android Studio Chrome Telegram Desktop WhatsApp Web"

rem Check each software
for %%s in (%softwareList%) do (
    echo Checking if %%s is installed...
    echo.

    rem Use the WMIC command to query the software list
    wmic product get name | findstr /i "%%s" > nul
    
    rem Check the error level to determine if the software is installed or not
    if errorlevel 1 (
        echo %%s is not installed.
        echo.
    ) else (
        echo %%s is already installed.
        echo.
    )
)

pause
