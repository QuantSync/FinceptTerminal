# Check if D:\vs_BuildTools.exe exists
if (-not (Test-Path "D:\vs_BuildTools.exe")) {
    Write-Host "Downloading vs_BuildTools.exe to D:\..." -ForegroundColor Cyan
    curl.exe -L "https://aka.ms/vs/17/release/vs_BuildTools.exe" -o "D:\vs_BuildTools.exe"
}

Write-Host "Requesting Administrator privileges to install MSVC to D:\BuildTools..." -ForegroundColor Cyan
Start-Process -FilePath "D:\vs_BuildTools.exe" -ArgumentList "--installPath D:\BuildTools --add Microsoft.VisualStudio.Workload.VCTools --includeRecommended --passive --norestart" -Verb RunAs

Write-Host "Visual Studio Installer launched! Please click 'Yes' on the Windows UAC prompt." -ForegroundColor Green
