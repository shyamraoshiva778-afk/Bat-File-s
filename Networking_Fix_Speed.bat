@echo off
title 🧠 Ultimate Network Fix & Internet Speed Booster
color 0A
echo.
echo ==================================================
echo         NETWORK FIX & SPEED OPTIMIZER TOOL
echo ==================================================
echo.
echo Running as Administrator is required!
echo.

:: Check admin rights
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Please run this file as Administrator!
    pause
    exit
)

echo Step 1: Resetting TCP/IP stack...
netsh int ip reset
echo Done.
echo.

echo Step 2: Resetting Winsock catalog...
netsh winsock reset
echo Done.
echo.

echo Step 3: Flushing DNS cache...
ipconfig /flushdns
echo Done.
echo.

echo Step 4: Releasing old IP address...
ipconfig /release
echo Done.
echo.

echo Step 5: Renewing IP address...
ipconfig /renew
echo Done.
echo.

echo Step 6: Clearing ARP cache...
netsh interface ip delete arpcache
echo Done.
echo.

echo Step 7: Resetting firewall rules...
netsh advfirewall reset
echo Done.
echo.

echo Step 8: Optimizing TCP parameters for high speed...
netsh int tcp set global autotuninglevel=normal
netsh int tcp set global chimney=enabled
netsh int tcp set global rss=enabled
netsh int tcp set global dca=enabled
netsh int tcp set global ecncapability=disabled
netsh int tcp set heuristics disabled
echo Done.
echo.

echo Step 9: Cleaning temporary files...
del /q /f /s "%TEMP%\*"
echo Done.
echo.

echo Step 10: Restarting network adapter...
net stop "dhcp"
net start "dhcp"
ipconfig /registerdns
echo Done.
echo.

echo ==================================================
echo ✅ All network repairs completed successfully!
echo Please restart your computer for full effect.
echo ==================================================
pause
exit
