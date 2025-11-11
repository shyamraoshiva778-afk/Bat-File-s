@echo off
:: =====================================================
:: Windows Deep Cleanup Script - by Kabali Gamer
:: =====================================================
echo.
echo 🧹 Starting Windows Cleanup... Please wait...
echo.

:: Run as admin check
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo ❌ Please run this file as Administrator.
    pause
    exit
)

:: Step 1: Delete Prefetch files
echo 🔹 Cleaning Prefetch...
del /s /q "C:\Windows\Prefetch\*.*" >nul 2>&1

:: Step 2: Delete Temp folders
echo 🔹 Cleaning TEMP folders...
del /s /q "%temp%\*.*" >nul 2>&1
del /s /q "C:\Windows\Temp\*.*" >nul 2>&1

:: Step 3: Empty Recycle Bin
echo 🔹 Emptying Recycle Bin...
PowerShell.exe -NoProfile -Command "Clear-RecycleBin -Force -ErrorAction SilentlyContinue"

:: Step 4: Clean Delivery Optimization Files
echo 🔹 Cleaning Delivery Optimization Files...
del /s /q "C:\ProgramData\Microsoft\Windows\DeliveryOptimization\Cache\*.*" >nul 2>&1

:: Step 5: Clean DirectX Shader Cache
echo 🔹 Cleaning DirectX Shader Cache...
rd /s /q "%LocalAppData%\D3DSCache" >nul 2>&1

:: Step 6: Clean Windows Error Reports & Diagnostics
echo 🔹 Cleaning Windows Error Reporting & Diagnostics...
del /s /q "C:\ProgramData\Microsoft\Windows\WER\*.*" >nul 2>&1
del /s /q "%LocalAppData%\Microsoft\Windows\WER\*.*" >nul 2>&1
del /s /q "C:\ProgramData\Microsoft\Diagnosis\*.*" >nul 2>&1

:: Step 7: Use CleanMgr to auto clean thumbnails, temp files, etc.
echo 🔹 Running Cleanmgr (Disk Cleanup) silently...

:: Configure Cleanmgr settings in the registry
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Temporary Files" /v StateFlags0001 /t REG_DWORD /d 2 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Thumbnails" /v StateFlags0001 /t REG_DWORD /d 2 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Recycle Bin" /v StateFlags0001 /t REG_DWORD /d 2 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Delivery Optimization Files" /v StateFlags0001 /t REG_DWORD /d 2 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\DirectX Shader Cache" /v StateFlags0001 /t REG_DWORD /d 2 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Windows Error Reporting Files" /v StateFlags0001 /t REG_DWORD /d 2 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Feedback Diagnostics" /v StateFlags0001 /t REG_DWORD /d 2 /f

:: Run Disk Cleanup silently
cleanmgr /sagerun:1

echo.
echo ✅ Cleanup completed successfully!
echo 💻 Your PC is now optimized.
echo.
pause
exit
