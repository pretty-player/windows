@echo off
setlocal enabledelayedexpansion

:: Check for arguments
if "%~1"=="" (
    echo Usage: livehost.bat [start_num] [end_num]
    echo Example: livehost.bat 1 20
    pause
    exit /b
)

set "start_num=%~1"
set "end_num=%~2"

echo "========================================================================"
echo "|      MULTI-ADAPTER NETWORK SCANNER https://github.com/pretty-player  |"
echo "========================================================================"

:: Loop through every line in ipconfig that has an IPv4 address
for /f "tokens=2 delims=:" %%a in ('ipconfig ^| findstr /I "ipv4"') do (
    
    :: Clean the IP and extract the first 3 octets (the prefix)
    for /f "tokens=1-3 delims=. " %%b in ("%%a") do (
        set "prefix=%%b.%%c.%%d."
    )

    echo.
    echo Scanning Network: !prefix!X
    echo -------------------------------------------------------

    :: Perform the scan for this specific prefix
    for /L %%i in (!start_num!, 1, !end_num!) do (
        set "target=!prefix!%%i"
        
        :: Ping once, 200ms timeout
        ping -n 1 -w 200 !target! >nul
        
        if !errorlevel! == 0 (
            echo [ LIVE ] !target!
        ) else (
            :: Optional: remove the 'rem' below to see down IPs too
            rem echo [ DOWN ] !target!
        )
    )
    echo -------------------------------------------------------
)

echo.
echo All network scans complete.
