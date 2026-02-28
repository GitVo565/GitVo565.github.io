@echo off
setlocal
title Create File Map - All Files and Directories

:: Use the drive where this script is run from (e.g. C: or D:)
set "DRIVE=%~d0"
if not defined DRIVE set "DRIVE=%CD:~0,2%"

:: Timestamp for filename (no invalid chars)
for /f "tokens=2 delims==" %%I in ('wmic os get localdatetime /value 2^>nul') do set "dt=%%I"
set "stamp=%dt:~0,8%_%dt:~8,6%"
set "stamp=%stamp: =0%"

:: Output in same folder as script; name includes computer and drive
set "OUT=%~dp0FileMap_%COMPUTERNAME%_%DRIVE:~0,1%_%stamp%.txt"

echo Creating file map for %DRIVE%\ (all files including hidden)...
echo Output: %OUT%
echo.

:: /a = all attributes (hidden, system, etc.)  /s = recursive  /b = bare list (path only)
:: Remove /b if you want size, date, and directory headers
dir "%DRIVE%\*" /a /s /b > "%OUT%" 2>&1

echo Done. Lines written:
find /c /v "" < "%OUT%"
echo.
pause
