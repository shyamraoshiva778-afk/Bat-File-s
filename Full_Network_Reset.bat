@echo off
title 🌐 Full Network Reset (Wi-Fi + Settings)
color 0C
echo ==================================================
echo       ⚙️ FULL NETWORK RESET TOOL FOR WINDOWS
echo ==================================================
echo.
echo This will:
echo  - Reset all network settings
echo  - Forget all saved Wi-Fi passwords
echo  - Rebuild IP, DNS, and Winsock stacks
echo.
echo ⚠️ WARNING: You will be disconnected from the Internet.
echo ⚠️ Saved Wi-Fi networks will be deleted permanently.
echo.
pause

:: Check for admin rights
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Please run this file as Administrator!
    pause
    exit
)

echo.
echo Step 1: Resetting TCP/IP stack...
netsh int ip reset
echo ✅ TCP/IP stack reset complete.
echo.

echo Step 2: Resetting Winsock catalog...
netsh winsock reset
echo ✅ Winsock reset complete.
echo.

echo Step 3: Flushing DNS cache...
ipconfig /flushdns
echo ✅ DNS cache flushed.
echo.

echo Step 4: Releasing and renewing IP configuration...
ipconfig /release
ipconfig /renew
echo ✅ IP configuration refreshed.
echo.

echo Step 5: Forgetting all saved Wi-Fi networks...
netsh wlan delete profile name=*
echo ✅ All saved Wi-Fi networks removed.
echo.

echo Step 6: Restarting networking services...
net stop "dhcp" >nul 2>&1
net start "dhcp" >nul 2>&1
net stop "nla" >nul 2>&1
net start "nla" >nul 2>&1
echo ✅ Network services restarted.
echo.

echo Step 7: Resetting Firewall settings...
netsh advfirewall reset
echo ✅ Firewall reset complete.
echo.

echo ==================================================
echo ✅ ALL NETWORK SETTINGS HAVE BEEN RESET SUCCESSFULLY!
echo 💡 Please RESTART your computer to finish the reset.
echo ==================================================
pause
exit
