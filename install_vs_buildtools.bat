@echo off
:: Self-elevate to Administrator
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
    echo Requesting administrator privileges...
    powershell -Command "Start-Process cmd.exe -ArgumentList '/c \"\"%~f0\"\"' -Verb RunAs"
    exit /B
)

cd /D "%~dp0"
title Installing Visual Studio 2022 C++ Build Tools

echo ======================================================================
echo Installing Visual Studio 2022 C++ Build Tools to D:\BuildTools...
echo This will take ~5-10 minutes. A progress window will appear.
echo ======================================================================
echo.

if not exist "D:\vs_BuildTools.exe" (
    echo Downloading vs_BuildTools.exe...
    curl -L "https://aka.ms/vs/17/release/vs_BuildTools.exe" -o "D:\vs_BuildTools.exe"
)

"D:\vs_BuildTools.exe" --installPath "D:\BuildTools" --add Microsoft.VisualStudio.Workload.VCTools --includeRecommended --passive --norestart

echo.
echo ======================================================================
echo Installation completed! You can now close this window.
echo ======================================================================
pause
